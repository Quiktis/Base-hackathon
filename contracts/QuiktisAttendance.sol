// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title QuiktisAttendance
 * @author Quiktis (github.com/Quiktis)
 * @notice Anchors verified real-world event attendance onto Base.
 *         Off-chain ticketing stays fast; on-chain records are permanent & tamper-proof.
 */
contract QuiktisAttendance {
    address public owner;

    mapping(bytes32 => mapping(address => bool)) public attended;
    mapping(bytes32 => address[]) public attendees;
    mapping(bytes32 => string) public eventMetadata;

    event AttendanceRecorded(bytes32 indexed eventId, address indexed attendee, uint256 timestamp);
    event EventAnchored(bytes32 indexed eventId, string metadata, uint256 totalAttendees, uint256 timestamp);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Register an event with a metadata string (title, date, etc.)
    function anchorEvent(bytes32 eventId, string calldata metadata) external onlyOwner {
        eventMetadata[eventId] = metadata;
    }

    /// @notice Batch record verified check-ins from a real-world event
    function batchRecordAttendance(bytes32 eventId, address[] calldata _attendees) external onlyOwner {
        for (uint i = 0; i < _attendees.length; i++) {
            if (!attended[eventId][_attendees[i]]) {
                attended[eventId][_attendees[i]] = true;
                attendees[eventId].push(_attendees[i]);
                emit AttendanceRecorded(eventId, _attendees[i], block.timestamp);
            }
        }
        emit EventAnchored(eventId, eventMetadata[eventId], attendees[eventId].length, block.timestamp);
    }

    /// @notice Returns total verified attendees for an event
    function getAttendeeCount(bytes32 eventId) external view returns (uint256) {
        return attendees[eventId].length;
    }

    /// @notice Returns true if an address was verified at the event
    function verifyAttendance(bytes32 eventId, address attendee) external view returns (bool) {
        return attended[eventId][attendee];
    }
}

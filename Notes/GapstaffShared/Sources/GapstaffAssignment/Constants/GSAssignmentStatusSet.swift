//
//  GSAssignmentStatusSet.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 22/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import Foundation

public struct GSAssignmentStatusSet {
    
    public static let myShift: Set<GSAssignmentStatus> = [.ASSIGNED,
                                                          .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                          .TRANSFER_APPLIED,
                                                          .TRANSFER_AWAITING_APPROVAL,
                                                          .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP,
                                                          .CANCELED]
    
    public static let swap: Set<GSAssignmentStatus> = [.ASSIGNED,
                                                       .TRANSFER_APPLIED,
                                                       .TRANSFER_APPLICATION_APPLIED,
                                                       .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                       .TRANSFER_AWAITING_APPROVAL,
                                                       .TRANSFER_APPLICATION_AWAITING_APPROVAL,
                                                       .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP,
                                                       .TRANSFER_AVAILABLE,
                                                       .TRANSFER_APPLICATION_DECLINED,
                                                       .CANCELED,
                                                       .TRANSFER_AWAITING_APPROVAL_SWAP]
    
    public static let openShift: Set<GSAssignmentStatus> = [.CAN_APPLY,
                                                            .CAN_APPLY_DECLINED,
                                                            .APPLIED,
                                                            .APPLIED_BINDING,
                                                            .INVITATION_REQUEST,
                                                            .INVITATION_REQUEST_DECLINED,
                                                            .ASSIGNED,
                                                            .TRANSFER_APPLIED,
                                                            .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                            .TRANSFER_AWAITING_APPROVAL,
                                                            .CANCELED,
                                                            .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP]
    
    public static let choiceCalendar: Set<GSAssignmentStatus> = [.ASSIGNED,
                                                                 .TRANSFER_APPLIED,
                                                                 .TRANSFER_AWAITING_APPROVAL,
                                                                 .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                                 .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP]
    
    public static let swapCalendar: Set<GSAssignmentStatus> = [.ASSIGNED,
                                                               .TRANSFER_APPLIED,
                                                               .TRANSFER_AWAITING_APPROVAL,
                                                               .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                               .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP,
                                                               .TRANSFER_AVAILABLE,
                                                               .CANCELED]
    
    public static let topPriority: Set<GSAssignmentStatus> = [.ASSIGNED,
                                                              .TRANSFER_APPLIED,
                                                              .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                              .TRANSFER_AWAITING_APPROVAL,
                                                              .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP]
    
    public static let transfer: Set<GSAssignmentStatus> = [.TRANSFER_AVAILABLE,
                                                           .TRANSFER_APPLICATION_DECLINED,
                                                           .TRANSFER_APPLICATION_APPLIED,
                                                           .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                           .TRANSFER_APPLIED,
                                                           .TRANSFER_AWAITING_APPROVAL]
}

//
//  AssignmentStatusSet.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 22/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import Foundation

struct AssignmentStatusSet {
    
    static let myShift: Set<AssignmentStatus> = [.ASSIGNED,
                                                 .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                 .TRANSFER_APPLIED,
                                                 .TRANSFER_AWAITING_APPROVAL,
                                                 .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP,
                                                 .CANCELED]
    
    static let swap: Set<AssignmentStatus> = [.ASSIGNED,
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
    
    static let openShift: Set<AssignmentStatus> = [.CAN_APPLY,
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
    
    static let choiceCalendar: Set<AssignmentStatus> = [.ASSIGNED,
                                                        .TRANSFER_APPLIED,
                                                        .TRANSFER_AWAITING_APPROVAL,
                                                        .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                        .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP]
    
    static let swapCalendar: Set<AssignmentStatus> = [.ASSIGNED,
                                                      .TRANSFER_APPLIED,
                                                      .TRANSFER_AWAITING_APPROVAL,
                                                      .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                      .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP,
                                                      .TRANSFER_AVAILABLE,
                                                      .CANCELED]
    
    static let topPriority: Set<AssignmentStatus> = [.ASSIGNED,
                                                     .TRANSFER_APPLIED,
                                                     .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                     .TRANSFER_AWAITING_APPROVAL,
                                                     .TRANSFER_APPLICATION_AWAITING_APPROVAL_SWAP]
    
    static let transfer: Set<AssignmentStatus> = [.TRANSFER_AVAILABLE,
                                                  .TRANSFER_APPLICATION_DECLINED,
                                                  .TRANSFER_APPLICATION_APPLIED,
                                                  .TRANSFER_APPLICATION_APPLIED_SWAP,
                                                  .TRANSFER_APPLIED,
                                                  .TRANSFER_AWAITING_APPROVAL]
}

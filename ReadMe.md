# ACT Request Approval System

A comprehensive Material Request Management System for Business Central with approval workflow integration.

## Overview

This solution extends Microsoft Dynamics 365 Business Central with a complete Material Request management system that supports both Purchase and Transfer requests with configurable approval workflows.

## Features

- **Dual Request Types**: Purchase Requests and Transfer Requests
- **Vendor Comparison**: Support for up to 3 vendors with price comparison
- **Approval Workflow**: Integrated with Business Central's native approval system
- **Status Management**: Open → Pending → Approved workflow states
- **Dimension Support**: Shortcut Dimension 1 & 2 integration
- **Duplicate Prevention**: Vendor validation to prevent duplicate entries
- **Role Center Integration**: Quick access from Business Manager Role Center

##  Technical Architecture

### Tables
- **50101 ACT Request Header**: Main document header table
- **50100 ACT Request Line2**: Document lines with vendor comparison fields

### Pages
- **50100 ACT Request Document**: Main document page with subform
- **50101 ACT Request Subform**: Line items subform
- **50102 ACT Request List**: List view of all requests
- **Page Extension**: Business Manager Role Center integration

### Codeunits
- **50100 Custom Workflow Mgmt.**: Custom workflow event handling

###   Approval Enum
- **50100 ApprovalEnum**: Handle Document status

##  Installation

1. **Compile the Extension**:
   ```bash
   alc.exe /project:. /packagecachepath:./.alpackages /out:./bin/ACTRequest.app

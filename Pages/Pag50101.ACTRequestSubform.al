page 50101 "ACT Request Subform"
{
    Caption = 'ACT Request Subform';
    PageType = ListPart;
    SourceTable = "ACT Request Line2";
    SourceTableView = sorting("Request No.", "Line No.");

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item number.';
                    Editable = IsEditable;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the item.';
                    Editable = IsEditable;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity requested.';
                    Editable = IsEditable;
                }
                field("Vendor 1"; Rec."Vendor 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first vendor option.';
                    Editable = IsEditable;
                }
                field("Vendor 1 Price"; Rec."Vendor 1 Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the price from vendor 1.';
                    Editable = IsEditable;
                }
                field("Vendor 1 Accepted"; Rec."Vendor 1 Accepted")
                {
                    ApplicationArea = All;
                    Caption= 'Acpt';
                    ToolTip = 'Specifies if vendor 1 is accepted.';
                    Editable = IsEditable;
                }
                field("Vendor 2"; Rec."Vendor 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the second vendor option.';
                    Editable = IsEditable;
                }
                field("Vendor 2 Price"; Rec."Vendor 2 Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the price from vendor 2.';
                    Editable = IsEditable;
                }
                field("Vendor 2 Accepted"; Rec."Vendor 2 Accepted")
                {
                    ApplicationArea = All;
                    Caption= 'Acpt';
                    ToolTip = 'Specifies if vendor 2 is accepted.';
                    Editable = IsEditable;
                }
                field("Vendor 3"; Rec."Vendor 3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the third vendor option.';
                    Editable = IsEditable;
                }
                field("Vendor 3 Price"; Rec."Vendor 3 Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the price from vendor 3.';
                    Editable = IsEditable;
                }
                field("Vendor 3 Accepted"; Rec."Vendor 3 Accepted")
                {
                    ApplicationArea = All;
                    Caption= 'Acpt';
                    ToolTip = 'Specifies if vendor 3 is accepted.';
                    Editable = IsEditable;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetEditable();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetEditable();
    end;

    local procedure SetEditable()
    var
        ACTRequestHeader: Record "ACT Request Header";
    begin
        if ACTRequestHeader.Get(Rec."Request No.") then
            IsEditable := ACTRequestHeader.Status = ACTRequestHeader.Status::Open
        else
            IsEditable := true;
    end;

    var
        IsEditable: Boolean;
}
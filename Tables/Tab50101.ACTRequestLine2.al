table 50100 "ACT Request Line2"
{
    Caption = 'ACT Request Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Request No."; Code[20])
        {
            Caption = 'Request No.';
            TableRelation = "ACT Request Header"."Request No.";
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
            DataClassification = CustomerContent;

        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("Item No.")));
            Editable = false;
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(6; "Vendor 1"; Code[20])
        {
            Caption = 'Vendor 1';
            TableRelation = Vendor;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateVendorNo("Vendor 1", 1);
            end;
        }
        field(7; "Vendor 1 Price"; Decimal)
        {
            Caption = 'Vendor 1 Price';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(8; "Vendor 1 Accepted"; Boolean)
        {
            Caption = 'Vendor 1 Accepted';
            DataClassification = CustomerContent;

        }
        field(9; "Vendor 2"; Code[20])
        {
            Caption = 'Vendor 2';
            TableRelation = Vendor;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateVendorNo("Vendor 2", 2);
            end;
        }
        field(10; "Vendor 2 Price"; Decimal)
        {
            Caption = 'Vendor 2 Price';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(11; "Vendor 2 Accepted"; Boolean)
        {
            Caption = 'Vendor 2 Accepted';
            DataClassification = CustomerContent;
        }
        field(12; "Vendor 3"; Code[20])
        {
            Caption = 'Vendor 3';
            TableRelation = Vendor;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateVendorNo("Vendor 3", 3);
            end;
        }
        field(13; "Vendor 3 Price"; Decimal)
        {
            Caption = 'Vendor 3 Price';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(14; "Vendor 3 Accepted"; Boolean)
        {
            Caption = 'Vendor 3 Accepted';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Request No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ACTRequestLine: Record "ACT Request Line2";
    begin
        if "Line No." = 0 then begin
            ACTRequestLine.SetRange("Request No.", "Request No.");
            if ACTRequestLine.FindLast() then
                "Line No." := ACTRequestLine."Line No." + 10000
            else
                "Line No." := 10000;
        end;
    end;
    local procedure ValidateVendorNo(VendorNo: Code[20]; CurrentFieldNo: Integer)
    begin
        if VendorNo = '' then
            exit;

        if CurrentFieldNo = 1 then begin
            if (VendorNo = "Vendor 2") or (VendorNo = "Vendor 3") then
                Error('Vendor %1 is already used in Vendor 2 or Vendor 3.', VendorNo);
        end
        else if CurrentFieldNo = 2 then begin
            if (VendorNo = "Vendor 1") or (VendorNo = "Vendor 3") then
                Error('Vendor %1 is already used in Vendor 1 or Vendor 3.', VendorNo);
        end
        else if CurrentFieldNo = 3 then begin
            if (VendorNo = "Vendor 1") or (VendorNo = "Vendor 2") then
                Error('Vendor %1 is already used in Vendor 1 or Vendor 2.', VendorNo);
        end;
    end;
}
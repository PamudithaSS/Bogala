table 50002 "Purchase Requistion Lines"
{
    fields
    {
        field(1; "Document No."; Code[20])
        { }
        field(2; "Line No."; Integer)
        { }
        field(3; "No."; Code[20])
        {
            TableRelation = if ("Document Type" = CONST(PR)) Item."No."
            ELSE
            if ("Document Type" = CONST(SR)) "G/L Account"."No.";

            trigger OnValidate();
            var
                Item: Record Item;
                GLAccount: Record "G/L Account";
                PurchaseReqHdr: Record "Purchase Requisition Header";
            begin
                IF ("Document Type" = "Document Type"::PR) then begin
                    Item.GET("No.");
                    Description := Item.Description;
                    "Purch. Unit of Measure" := Item."Base Unit of Measure";
                    "Item Category" := Item."Item Category Code";
                    //"Product Group Code" := Item."Product Group Code";   ---OLD---
                    "Product Group Code" := Item."BGL Product Group Code";
                    "Last Direct Cost" := Item."Last Direct Cost";
                    PurchaseReqHdr.GET("Document Type", "Document No.");
                    "Item Required Date" := PurchaseReqHdr."Items Required Date";
                    "Currency Code" := PurchaseReqHdr."Currency Code";
                    Location := PurchaseReqHdr."Location Code";
                end
                else
                    if ("Document Type" = "Document Type"::SR) then begin
                        GLAccount.GET("No.");
                        Description := GLAccount.Name;
                    end;
            end;
        }
        field(4; Description; Text[60])
        { }
        field(5; Quantity; Decimal)
        {
            trigger OnValidate();
            var
                ItemVariant: Record "Item Variant";
            begin
                IF ("Document Type" = "Document Type"::PR) AND ("Variant Code" = '') then begin
                    ItemVariant.RESET;
                    ItemVariant.SETRANGE("Item No.", "No.");
                    if ItemVariant.FindFirst() then
                        TestField("Variant Code");
                end;
                "Item Value" := Quantity * UnitCost;
            end;
        }
        field(7; "Purch. Unit of Measure"; Code[10])
        {
            TableRelation = "Unit of Measure".Code;
        }
        field(8; "PO No."; Code[20])
        {
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Invoice));
        }
        field(9; "PO Quantity"; Decimal)
        { }
        field(10; "Required Delivery Date"; Date)
        { }
        field(11; "Document Type"; Option)
        {
            OptionCaption = 'PR,Fixed Asset,SR';
            OptionMembers = "PR","Fixed Asset","SR";
        }
        field(12; Remarks; Text[100])
        { }
        field(13; UnitCost; Decimal)
        {
            DecimalPlaces = 0 : 4;

            trigger OnValidate();
            begin
                "Item Value" := Quantity * UnitCost;
            end;
        }
        field(15; "Last Direct Cost"; Decimal)
        { }
        field(16; "Item Value"; Decimal)
        { }
        field(17; "Item Required Date"; Date)
        { }
        field(23; "Variant Code"; Code[20])
        {
            TableRelation = "Item Variant";
        }
        field(24; "AssetNo."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";
        }
        field(26; "Vendor No."; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(27; "Division Code"; Code[10])
        {
            //TableRelation = Table10000787;
        }
        field(28; "Item Category"; Code[10])
        {
            TableRelation = "Item Category";
        }
        field(29; "Product Group Code"; Code[10])
        {
            TableRelation = "BGL Product Group";
        }
        field(45; "Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(46; Location; Code[10])
        {
            TableRelation = Location.Code;
        }
        field(1001; Status; Option)
        {
            OptionMembers = Open,Released;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        { }
    }

    fieldgroups
    { }

    trigger OnDelete();
    begin
        TestStatusOpen;
    end;

    trigger OnInsert();
    var
        PurchaseReqHdr: Record "Purchase Requisition Header";
    begin
        TestStatusOpen;
        if PurchaseReqHdr.GET("Document Type", "Document No.") then begin
            Status := PurchaseReqHdr.Status;
        end;
    end;

    trigger OnModify();
    begin
        if "Vendor No." = xRec."Vendor No." then
            TestStatusOpen;
    end;

    procedure TestStatusOpen();
    var
        PurchaseReqHdr: Record "Purchase Requisition Header";
    begin
        PurchaseReqHdr.GET("Document Type", "Document No.");
        PurchaseReqHdr.TestField(Status, PurchaseReqHdr.Status::Open);
    end;
}


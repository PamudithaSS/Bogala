tableextension 50007 PurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50000; "Delivery Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Part Shipment"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Vendor Invoice Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Shiipping Marks"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Description 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Tax Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tax Detail"."Tax Group Code";
        }
        field(50025; "Approval Entry"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Approval Entry";
        }
        field(50026; "Created User"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(50027; "PO No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(50028; "Remarks"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Partialy Received ,Cancelled,Partially Received PO Close';
            OptionMembers = " ","Partialy Received","Cancelled","Partially Received PO Close";
        }
        field(50029; "Approve User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            TableRelation = User."User Name" where("User Name" = filter('SALIYA|ANURA|CHAMINDA|MUHANDIRAM|HEMANTHA|DEVIKA'));
        }
        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            begin
                "Created User" := UserId();
            end;
        }
        // modify("Order Date")
        // {
        //     Editable = false;
        // }
    }
    trigger OnAfterInsert()
    begin

    end;

    trigger OnBeforeDelete()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if not UserSetup."PO Delete" then
            Error('You cannot delete these documents');
    end;
}
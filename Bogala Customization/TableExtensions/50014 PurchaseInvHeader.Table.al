tableextension 50014 PurchaseInvHeader extends "Purch. Inv. Header"
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
        field(50026; "Created User"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50029; "Approve User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "Quote Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Local,Foreign,Service;
            OptionCaption = 'Local,Foreign,Service';
        }
    }
}
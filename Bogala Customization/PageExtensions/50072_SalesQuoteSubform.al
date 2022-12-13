pageextension 50072 SalesQuoteSub extends "Sales Quote Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Qty. Assigned")
        {
            field("Tax Group Code 1"; Rec."Tax Group Code")
            {
                ApplicationArea = All;
                Caption = 'Tax Group Code';
            }
            field("Tax Area Code 1"; Rec."Tax Area Code") 
            {
                ApplicationArea = All;
                Caption = 'Tax Area Code';
            }
        }
        addafter(Description)
        {
            field("Shipping Marks"; Rec."Shipping Marks")
            {
                ApplicationArea = All;
            }
            field("No.of Packages"; Rec."No.of Packages")
            {
                ApplicationArea = All;
            }
            field("Packing Comm."; Rec."Packing Comm.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
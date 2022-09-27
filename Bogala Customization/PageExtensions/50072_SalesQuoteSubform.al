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
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
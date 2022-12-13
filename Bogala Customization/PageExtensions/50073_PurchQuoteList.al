pageextension 50073 PurchQuoteList extends "Purchase Quotes"
{
    layout
    {
        // Add changes to page layout here
        addafter("Location Code")
        {
            field("Created User"; Rec."Created User")
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
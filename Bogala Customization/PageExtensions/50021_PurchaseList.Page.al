pageextension 50021 PurchaseList extends "Purchase List"
{
    layout
    {
        addafter("No.")
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Ship-to Contact")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Currency Code")
        {
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
    }
}
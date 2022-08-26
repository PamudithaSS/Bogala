pageextension 50028 PostedPurchaseReceipt extends "Posted Purchase Receipt"
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
    }
}
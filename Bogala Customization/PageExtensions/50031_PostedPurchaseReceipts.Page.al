pageextension 50031 PostedPurchaseReceipts extends "Posted Purchase Receipts"
{
    layout
    {
        addafter("Pay-to Contact")
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Shipment Method Code")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = All;
            }
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
        }
        modify("Posting Date")
        {
            Importance = Promoted;
        }
    }
}
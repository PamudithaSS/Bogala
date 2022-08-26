pageextension 50032 PostedPurchaseInvoices extends "Posted Purchase Invoices"
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
        addafter("Shipment Method Code")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
            field("Created User"; Rec."Created User")
            {
                ApplicationArea = All;
            }
        }
    }
}
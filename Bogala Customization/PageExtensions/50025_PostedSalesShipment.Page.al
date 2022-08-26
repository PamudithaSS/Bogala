pageextension 50025 PostedSalesShipment extends "Posted Sales Shipment"
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
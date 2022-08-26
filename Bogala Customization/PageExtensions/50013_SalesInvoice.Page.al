pageextension 50013 SalesInvoice extends "Sales Invoice"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field(Vessel; Rec.Vessel)
            {
                ApplicationArea = All;
            }
            field("Flight No"; Rec."Flight No")
            {
                ApplicationArea = All;
            }
            field("Delivery Details"; Rec."Delivery Details")
            {
                ApplicationArea = All;
            }
            field(Destination; Rec.Destination)
            {
                ApplicationArea = All;
            }
            field("Customer Order Number."; Rec."Customer Order Number.")
            {
                ApplicationArea = All;
            }
            field("Customer Order Date"; Rec."Customer Order Date")
            {
                ApplicationArea = All;
            }
        }
        addafter(Status)
        {
            field("Shipping Marks"; Rec."Shipping Marks")
            {
                ApplicationArea = All;
            }
            field("Packing Comm."; Rec."Packing Comm.")
            {
                ApplicationArea = All;
            }
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
        addafter("Prices Including VAT")
        {
            field("LC No"; Rec."LC No")
            {
                ApplicationArea = All;
            }
            field("LC Date"; Rec."LC Date")
            {
                ApplicationArea = All;
            }
            field("LC Bank"; Rec."LC Bank")
            {
                ApplicationArea = All;
            }
            field("Bank Code"; Rec."Bank Code")
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
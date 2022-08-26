pageextension 50014 SalesCreditMemo extends "Sales Credit Memo"
{
    layout
    {
        addafter(Status)
        {
            field(Vessel; Rec.Vessel)
            {
                ApplicationArea = All;
            }
            field("Description 2"; Rec."Description 2")
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
            field("Shipping Marks"; Rec."Shipping Marks")
            {
                ApplicationArea = All;
            }
            field("Packing Comm."; Rec."Packing Comm.")
            {
                ApplicationArea = All;
            }
            field("Customer Order Date"; Rec."Customer Order Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("VAT Bus. Posting Group")
        {
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                ApplicationArea = All;
            }
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
}
pageextension 50020 PurchaseCreditMemo extends "Purchase Credit Memo"
{
    layout
    {
        addafter(Status)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        // addafter("VAT Bus. Posting Group")
        // {
        //     field("Tax Liable"; Rec."Tax Liable")
        //     {
        //         ApplicationArea = All;
        //     }
        //     field("Tax Area Code"; Rec."Tax Area Code")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addlast(General)
        {
            field("Approve User ID"; Rec."Approve User ID")
            {
                ApplicationArea = All;
            }
        }
        modify("Incoming Document Entry No.")
        {
            Visible = false;
        }
    }
}
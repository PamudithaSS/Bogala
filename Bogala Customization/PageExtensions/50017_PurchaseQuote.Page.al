pageextension 50017 PurchaseQuote extends "Purchase Quote"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
            field("PO No. Series"; Rec."PO No. Series")
            {
                ApplicationArea = All;
            }
        }
        addafter("Assigned User ID")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
            }
            field("Approval Entry"; Rec."Approval Entry")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("Created User"; Rec."Created User")
            {
                ApplicationArea = All;
            }
        }
        addbefore("Payment Discount %")
        {
            field("Tax Group"; Rec."Tax Group")
            {
                ApplicationArea = All;
            }
            field("Tax Liable 1"; Rec."Tax Liable")
            {
                ApplicationArea = All;
                Caption = 'Tax Liable';
            }
            field("Tax Area Code 2"; Rec."Tax Area Code")
            {
                ApplicationArea = All;
                Caption = 'Tax Area Code';
            }
        }
        // addafter("VAT Bus. Posting Group")
        // {
        //     field("Tax Area Code"; Rec."Tax Area Code")
        //     {
        //         ApplicationArea = All;
        //     }
        //     field("Tax Liable"; Rec."Tax Liable")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addafter("Expected Receipt Date")
        {
            field("Shiipping Marks"; Rec."Shiipping Marks")
            {
                ApplicationArea = All;
            }
        }

    }
    actions
    {
        modify(MakeOrder)
        {
            trigger OnBeforeAction()

            begin
                if Rec.Status <> Rec.Status::Released then
                    Error('Purchase Quote Should be Released');
            end;
        }
    }

}
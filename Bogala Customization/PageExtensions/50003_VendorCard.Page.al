pageextension 50003 VendorCard extends "Vendor Card"
{
    layout
    {
        addafter("Primary Contact No.")
        {
            field(BENE_ID_NO; Rec.BENE_ID_NO)
            {
                Caption = 'Bene ID No.';
                ApplicationArea = All;
            }
        }
        addafter("Our Account No.")
        {
            field("SWIFT Code"; Rec."SWIFT Code")
            {
                ApplicationArea = All;
            }
            field(BENE_BANK_CODE; Rec.BENE_BANK_CODE)
            {
                Caption = 'Bene Bank Code';
                ApplicationArea = All;
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = All;
            }
            field(BENE_BRANCH_CODE; Rec.BENE_BRANCH_CODE)
            {
                Caption = 'Bene Branch Code';
                ApplicationArea = All;
            }
            field("Branch Name"; Rec."Branch Name")
            {
                ApplicationArea = All;
            }
            field(BENE_ACCNO; Rec.BENE_ACCNO)
            {
                Caption = 'Bene Acc. No.';
                ApplicationArea = All;
            }
        }
        addafter("VAT Registration No.")
        {
            field("SVAT Registration No."; Rec."SVAT Registration No.")
            {
                ApplicationArea = All;
            }
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        modify("Preferred Bank Account Code")
        {
            Visible = false;
        }
        modify("Partner Type")
        {
            Visible = false;
        }
        modify("Tax Liable")
        {
            ApplicationArea = All;
        }
        modify("Tax Area Code")
        {
            ApplicationArea = All;
        }
    }
}
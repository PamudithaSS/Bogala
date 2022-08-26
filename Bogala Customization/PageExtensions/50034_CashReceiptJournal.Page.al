pageextension 50034 CashReceiptJournal extends "Cash Receipt Journal"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("VAT Amount")
        {
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                ApplicationArea = All;
            }
            field("Tax Liable"; Rec."Tax Liable")
            {
                ApplicationArea = All;
            }
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("Post and &Print")
        {
            Action(CustomerReceipt)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Print Customer Receipt';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                RunObject = Report "Customer - Payment Receipt";
            }
            Action(GLReceipt)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'GL Receipt';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                RunObject = Report "Receipt GL";
            }

        }
    }
}
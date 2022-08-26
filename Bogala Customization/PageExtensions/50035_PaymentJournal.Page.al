pageextension 50035 PaymentJournal extends "Payment Journal"
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
        addafter("Credit Amount")
        {
            field("Special Instruction 1"; Rec."Special Instruction 1")
            {
                ApplicationArea = All;
            }
            field("Special Instruction 2"; Rec."Special Instruction 2")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bal. Account No.")
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
        addafter("Bal. VAT Bus. Posting Group")
        {
            field(REM_TYPE; Rec.REM_TYPE)
            {
                ApplicationArea = All;
            }
            field(CHG_FROM; Rec.CHG_FROM)
            {
                ApplicationArea = All;
            }
        }
        addafter("Exported to Payment File")
        {
            field("Pick Up By"; Rec."Pick Up By")
            {
                ApplicationArea = All;
            }
            field("Pick Up Method"; Rec."Pick Up Method")
            {
                ApplicationArea = All;
            }
            field("Payment Type"; Rec."Payment Type")
            {
                ApplicationArea = All;
            }
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = true;
        }
        modify(ShortcutDimCode3)
        {
            Visible = true;
        }
        modify(ShortcutDimCode4)
        {
            Visible = true;
        }
        modify(ShortcutDimCode5)
        {
            Visible = true;
        }
        modify(ShortcutDimCode6)
        {
            Visible = true;
        }
        modify(ShortcutDimCode7)
        {
            Visible = true;
        }
        modify(ShortcutDimCode8)
        {
            Visible = true;
        }
    }

    actions
    {
        addafter("Post and &Print")
        {
            Action(GLVoucher)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Print G/L Voucher';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                RunObject = Report "Payment Voucher GL - MKS";
            }
            Action(BankVoucher)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Print Bank Voucher';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                RunObject = Report "Payment Voucher Bank - MKS";
            }
            Action(VendorVoucher)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Print Vendor Voucher';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                RunObject = Report "Payment Voucher - MKS";
            }
            Action(SVATCreditVoucher)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Print SVAT Credit Voucher';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                ApplicationArea = All;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    GenJournalLine: Record "Gen. Journal Line";
                begin
                    Clear(GenJournalLine);
                    GenJournalLine.SETRANGE("Journal Template Name", Rec."Journal Template Name");
                    GenJournalLine.SETRANGE("Journal Batch Name", Rec."Journal Batch Name");
                    GenJournalLine.SETRANGE("Document No.", Rec."Document No.");
                    IF GenJournalLine.FINDFIRST THEN
                        REPORT.RUN(50033, TRUE, FALSE, GenJournalLine)
                end;
            }
            Action(Test)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Test';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                ApplicationArea = All;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    MESSAGE(FORMAT(1 / 0.09878987));
                end;
            }
            // action("Cheque Print")
            // {
            //     Image = Check;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     ApplicationArea = All;
            //     RunObject = Report "Check - GK Mines";
            //     trigger OnAction()
            //     var
            //         GenJnalLineRec: Record "Gen. Journal Line";
            //     begin
            //         // GenJnalLineRec.Reset();
            //         // GenJnalLineRec.SetRange("Journal Template Name", Rec."Journal Template Name");
            //         // GenJnalLineRec.SetRange("Journal Batch Name", Rec."Journal Batch Name");
            //         // GenJnalLineRec.SetRange("Document No.", Rec."Document No.");
            //         // // GenJnalLineRec.SetRange("Line No.", Rec."Line No.");
            //         // Report.RunModal(50008, true, true, GenJnalLineRec);

            //     end;
            // }
            action("Check Print")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    genRec: Record "Gen. Journal Line";
                begin
                    genRec.Reset();
                    genRec.SetRange("Journal Template Name", Rec."Journal Template Name");
                    genRec.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    genRec.SetRange("Document No.", Rec."Document No.");
                    genRec.SetRange("Line No.", Rec."Line No.");
                    Report.RunModal(50054, true, true, genRec);
                end;
            }
        }
    }
}
pageextension 50038 BankAccountLedgerEntries extends "Bank Account Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
            field("Document Date"; Rec."Document Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Global Dimension 2 Code")
        {
            field(Exported; Rec.Exported)
            {
                ApplicationArea = All;
            }
        }
        addafter("Entry No.")
        {
            field("Special Instruction 1"; Rec."Special Instruction 1")
            {
                ApplicationArea = All;
            }
            field("Special Instruction 2"; Rec."Special Instruction 2")
            {
                ApplicationArea = All;
            }
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
            field("Exported File"; Rec."Exported File")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter("&Navigate")
        {
            Action(DeutscheBankDataExporting)
            {
                Image = ExportFile;
                Caption = 'Deutsche Bank Data Exporting';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Clear(BankLedEntry);
                    BankLedEntry.SETRANGE("Document No.", Rec."Document No.");
                    BankLedEntry.SETRANGE("Bank Account No.", Rec."Bank Account No.");
                    BankLedEntry.SETRANGE("Posting Date", Rec."Posting Date");
                    IF BankLedEntry.FINDFIRST THEN
                        XMLPORT.RUN(XMLPORT::"Deutsche bank data exporting N", TRUE, FALSE, BankLedEntry);
                end;
            }
            Action(PaymentAutomation)
            {
                Image = ExportFile;
                Caption = 'Payment Automation';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    BankLedgerEntry.SETRANGE("Document No.", Rec."Document No.");
                    IF BankLedgerEntry.FINDFIRST THEN
                        REPORT.RUN(50036, TRUE, TRUE, BankLedgerEntry);
                end;
            }
        }
    }
    var
        BankLedEntry: Record "Bank Account Ledger Entry";
        BankLedgerEntry: Record "Bank Account Ledger Entry";
}
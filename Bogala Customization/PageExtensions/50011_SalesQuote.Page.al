pageextension 50011 SalesQuote extends "Sales Quote"
{
    layout
    {
        // addafter("Campaign No.")
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
        addafter("Assigned User ID")
        {
            field("Bank Code"; Rec."Bank Code")
            {
                ApplicationArea = All;
            }
            field(Destination; Rec.Destination)
            {
                ApplicationArea = All;
            }
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(CancelApprovalRequest)
        {
            action(SalesQuote)
            {
                Image = PrintReport;
                Caption = 'Sales Quote';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Clear(SlsHdr);
                    SlsHdr.SetRange("Document Type", Rec."Document Type");
                    SlsHdr.SetRange("No.", Rec."No.");
                    Report.Run(50028, true, true, SlsHdr);
                end;
            }
            action(PerformaInvoice)
            {
                Image = PrintReport;
                Caption = 'Performa Invoice';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Clear(SlsHdr);
                    SlsHdr.SetRange("Document Type", Rec."Document Type");
                    SlsHdr.SetRange("No.", Rec."No.");
                    Report.Run(50010, true, true, SlsHdr);
                end;
            }
        }
        modify(MakeOrder)
        {
            trigger OnBeforeAction()

            begin
                if Rec.Status <> Rec.Status::Released then
                    Error('Sales Quote Should be Released');
            end;
        }
    }

    var
        SlsHdr: Record "Sales Header";
}
pageextension 50012 SalesOrder extends "Sales Order"
{
    layout
    {
        addafter("Document Date")
        {
            field("Customer Order Number."; Rec."Customer Order Number.")
            {
                ApplicationArea = All;
            }
            field("Customer Order Date"; Rec."Customer Order Date")
            {
                ApplicationArea = All;
            }
            field(Destination; Rec.Destination)
            {
                ApplicationArea = All;
            }
            field("Delivery Details"; Rec."Delivery Details")
            {
                ApplicationArea = All;
            }
        }
        addafter("Promised Delivery Date")
        {
            field(Vessel; Rec.Vessel)
            {
                ApplicationArea = All;
            }
            field("Flight No"; Rec."Flight No")
            {
                ApplicationArea = All;
            }
        }
        addafter("Opportunity No.")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("Shipping No. Series"; Rec."Shipping No. Series")
            {
                ApplicationArea = All;
            }
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
            field("Packing Comm."; Rec."Packing Comm.")
            {
                ApplicationArea = All;
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
            field("Shipping Marks"; Rec."Shipping Marks")
            {
                ApplicationArea = All;
            }
        }
        addafter("Due Date")
        {
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                ApplicationArea = All;
            }
            field("Tax Liable"; Rec."Tax Liable")
            {
                ApplicationArea = All;
            }
        }
        addafter("VAT Bus. Posting Group")
        {
            field("Bank Code"; Rec."Bank Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Shipping Advice")
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
        }
        modify("Requested Delivery Date")
        {
            Caption = 'Ex. Work Date';
        }
    }

    actions
    {
        addafter("Pick Instruction")
        {
            action(SalesOrder)
            {
                Image = PrintReport;
                Caption = 'Sales Order';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    SlsHdr: Record "Sales Header";
                begin
                    Clear(SlsHdr);
                    SlsHdr.SetRange("Document Type", Rec."Document Type");
                    SlsHdr.SetRange("No.", Rec."No.");
                    Report.Run(50037, true, true, SlsHdr);
                end;
            }
            action(SalesInvoice)
            {
                Image = PrintReport;
                Caption = 'Sales Invoice';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    SlsHdr: Record "Sales Header";
                begin
                    Clear(SlsHdr);
                    SlsHdr.SetRange("Document Type", Rec."Document Type");
                    SlsHdr.SetRange("No.", Rec."No.");
                    Report.Run(50029, true, true, SlsHdr);
                end;
            }
        }
    }
}
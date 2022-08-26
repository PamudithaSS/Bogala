report 50039 "Country wise Purchase Report"
{
    // version LNM-JIT

    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Country wise Purchase Report.rdl';

    dataset
    {
        dataitem("Country/Region"; "Country/Region")
        {
            column(txtCountryName; Name)
            {
            }
            column(date1; date1)
            {
            }
            column(date2; date2)
            {
            }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "Country/Region Code" = FIELD(Code);
                dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
                {
                    DataItemLink = "Pay-to Vendor No." = FIELD("No.");
                    dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");

                        trigger OnAfterGetRecord();
                        begin
                            IF decCurrencyFactor = 0 THEN
                                decCurrencyFactor := 1;

                            ValueLkr += ROUND("Purch. Inv. Line"."Amount Including VAT" / decCurrencyFactor, 0.01, '=');
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                                "Purch. Inv. Line".SETFILTER("Posting Date", '%1..%2', date1, date2);
                            END;
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF "Currency Factor" <= 0 THEN
                            decCurrencyFactor := 1.0
                        ELSE
                            decCurrencyFactor := "Purch. Inv. Header"."Currency Factor";
                    end;

                    trigger OnPreDataItem();
                    begin
                        IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                            "Purch. Inv. Header".SETRANGE("Posting Date", date1, date2);
                        END;
                    end;
                }
                dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
                {
                    DataItemLink = "Pay-to Vendor No." = FIELD("No.");
                    dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");

                        trigger OnAfterGetRecord();
                        begin
                            ValueLkr -= "Purch. Cr. Memo Line"."Amount Including VAT";
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                                "Purch. Cr. Memo Line".SETFILTER("Posting Date", '%1..%2', date1, date2);
                            END;
                        end;
                    }

                    trigger OnPreDataItem();
                    begin
                        IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                            "Purch. Cr. Memo Hdr.".SETFILTER("Posting Date", '%1..%2', date1, date2);
                        END;
                    end;
                }
                dataitem(Integer; Integer)
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(VendNo; Vendor."No.")
                    {
                    }
                    column(valuelkr; ValueLkr)
                    {
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(ValueLkr);
                end;
            }
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Group)
                {
                    field(date1; date1)
                    {
                        ApplicationArea = All;
                        Caption = 'From Date';
                    }
                    field(date2; date2)
                    {
                        ApplicationArea = All;
                        Caption = 'To Date';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        date1: Date;
        date2: Date;
        txtCountryName: Text[50];
        ValueLkr: Decimal;
        decCurrencyFactor: Decimal;
        Qty_: Decimal;
        ItemChrg_: Decimal;
        TotalChargeLinesValue: Decimal;
        recSalesInvoiceLine: Record "Sales Invoice Line";
        decTotItemChgLineAmount: Decimal;
        BillAmount: Decimal;
}


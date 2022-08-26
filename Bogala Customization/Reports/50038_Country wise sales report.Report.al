report 50038 "Country wise sales report"
{
    // version LNM-JIT

    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Country wise sales report.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(txtCountryName; txtCountryName)
            {
            }
            column(date1; date1)
            {
            }
            column(date2; date2)
            {
            }
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemLink = "Sell-to Customer No." = FIELD("No.");
                DataItemTableView = SORTING("Posting Date", "Gen. Bus. Posting Group") WHERE("Gen. Bus. Posting Group" = CONST('EXPORT'));
                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE(Type = CONST(Item));

                    trigger OnAfterGetRecord();
                    begin
                        IF decCurrencyFactor = 0 THEN
                            decCurrencyFactor := 1;
                        CLEAR(BillAmount);
                        BillAmount := Amount + (TotalChargeLinesValue * Quantity / Qty_);

                        ValueLkr += ROUND(BillAmount / decCurrencyFactor, 0.01, '=');
                    end;
                }

                trigger OnAfterGetRecord();
                var
                    recDefaultDimension: Record "Default Dimension";
                    recCustomer: Record Customer;
                    recCountry: Record "Country/Region";
                begin
                    IF "Currency Factor" <= 0 THEN
                        decCurrencyFactor := 1.0
                    ELSE
                        decCurrencyFactor := "Sales Invoice Header"."Currency Factor";

                    Qty_ := 0;
                    ItemChrg_ := 0;
                    decTotItemChgLineAmount := 0;
                    CLEAR(TotalChargeLinesValue);
                    recSalesInvoiceLine.RESET;
                    recSalesInvoiceLine.SETRANGE("Document No.", "No.");

                    IF recSalesInvoiceLine.FINDFIRST THEN
                        REPEAT
                            IF recSalesInvoiceLine.Type = "Sales Invoice Line".Type::"Charge (Item)" THEN BEGIN//sriyantha 06_02_2014
                                decTotItemChgLineAmount := decTotItemChgLineAmount + recSalesInvoiceLine."Line Amount";
                                TotalChargeLinesValue += recSalesInvoiceLine.Amount;
                                IF Qty_ > 0 THEN
                                    ItemChrg_ := decTotItemChgLineAmount / Qty_;//sriyantha 06_02_2014
                            END ELSE
                                IF recSalesInvoiceLine.Type = "Sales Invoice Line".Type::Item THEN //sriyantha 06_02_2014
                                    Qty_ += recSalesInvoiceLine.Quantity;  //sriyantha 06_02_2014
                        UNTIL recSalesInvoiceLine.NEXT = 0;
                end;

                trigger OnPreDataItem();
                begin
                    IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                        "Sales Invoice Header".SETFILTER("Posting Date", '%1..%2', date1, date2);
                    END;
                end;
            }
            dataitem("Sales Invoice Header1"; "Sales Invoice Header")
            {
                DataItemLink = "Sell-to Customer No." = FIELD("No.");
                DataItemTableView = SORTING("Posting Date", "Gen. Bus. Posting Group") ORDER(Ascending) WHERE("Gen. Bus. Posting Group" = CONST('LOCAL'));
                dataitem("Sales Invoice Line1"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = CONST(Item));

                    trigger OnAfterGetRecord();
                    begin
                        IF decCurrencyFactor = 0 THEN
                            decCurrencyFactor := 1;
                        CLEAR(BillAmount);
                        BillAmount := Amount + (TotalChargeLinesValue * Quantity / Qty_);
                        ValueLkr += ROUND(BillAmount / decCurrencyFactor, 0.01, '=');
                    end;
                }

                trigger OnAfterGetRecord();
                var
                    recDefaultDimension: Record "Default Dimension";
                    recCustomer: Record Customer;
                    recCountry: Record "Country/Region";
                begin

                    IF "Sales Invoice Header1"."Currency Factor" <= 0 THEN
                        decCurrencyFactor := 1.0
                    ELSE
                        decCurrencyFactor := "Sales Invoice Header1"."Currency Factor";

                    Qty_ := 0;
                    ItemChrg_ := 0;
                    decTotItemChgLineAmount := 0;
                    CLEAR(TotalChargeLinesValue);
                    recSalesInvoiceLine.RESET;
                    recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                    IF recSalesInvoiceLine.FINDFIRST THEN
                        REPEAT
                            IF recSalesInvoiceLine.Type = "Sales Invoice Line".Type::"Charge (Item)" THEN BEGIN//sriyantha 06_02_2014
                                decTotItemChgLineAmount := decTotItemChgLineAmount + recSalesInvoiceLine."Line Amount";
                                TotalChargeLinesValue += recSalesInvoiceLine.Amount;
                                IF Qty_ > 0 THEN
                                    ItemChrg_ := decTotItemChgLineAmount / Qty_;//sriyantha 06_02_2014
                            END ELSE
                                IF recSalesInvoiceLine.Type = "Sales Invoice Line".Type::Item THEN //sriyantha 06_02_2014
                                    Qty_ += recSalesInvoiceLine.Quantity;  //sriyantha 06_02_2014
                        UNTIL recSalesInvoiceLine.NEXT = 0;
                end;

                trigger OnPreDataItem();
                begin

                    IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                        "Sales Invoice Header1".SETFILTER("Posting Date", '%1..%2', date1, date2);
                    END;
                end;
            }
            dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
            {
                DataItemLink = "Sell-to Customer No." = FIELD("No.");
                DataItemTableView = SORTING("Posting Date");
                dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = FILTER(Item | ' ' | 'Charge (Item)'));
                }

                trigger OnPreDataItem();
                begin
                    IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                        "Sales Cr.Memo Header".SETFILTER("Posting Date", '%1..%2', date1, date2);
                    END;
                end;
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(valuelkr; ValueLkr)
                {
                }
            }

            trigger OnAfterGetRecord();
            var
                recCountry: Record "Country/Region";
            begin
                IF "Country/Region Code" <> '' THEN
                    IF recCountry.GET("Country/Region Code") THEN
                        txtCountryName := recCountry.Name;
                CLEAR(ValueLkr);
            end;
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


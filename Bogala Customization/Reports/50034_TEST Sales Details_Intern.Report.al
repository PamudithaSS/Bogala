report 50034 "TEST Sales Details_Intern"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("Posting Date", "Gen. Bus. Posting Group") WHERE("Gen. Bus. Posting Group" = CONST('EXPORT'));
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE(Type = CONST(Item));
                column(adi1; "Posting Date")
                {
                }
                column(adi2; txtDim4AppValue)
                {
                }
                column(adi3; "Sales Invoice Header"."Sell-to Customer Name")
                {
                }
                column(adi4; "Sales Invoice Header"."Shipping Agent Code")
                {
                }
                column(adi5; txtDim3CGValue)
                {
                }
                column(adi6; txtCountryName)
                {
                }
                column(adi7; "Sales Invoice Line"."Document No.")
                {
                }
                column(adi8; "Sales Invoice Line".Description)
                {
                }
                column(adi9; "Sales Invoice Line"."Description 2")
                {
                }
                column(adi10; "Sales Invoice Header"."Shipment Method Code")
                {
                }
                column(adi11; txtCurrencyCode[1])
                {
                }
                column(adi12; "Sales Invoice Line".Quantity)
                {
                }
                column(adi13; UPrice)
                {
                }
                column(adi14; BillAmount)
                {
                }
                column(adi15; ValueLkr)
                {
                }
                column(adi16; ExchRate)
                {
                }
                column(adi17; "Sales Invoice Header"."Order No.")
                {
                }
                column(adi18; "Sales Invoice Header"."Customer Order Number.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    UPrice := "Sales Invoice Line"."Unit Price" + ItemChrg_;//decTotItemChgLineAmount;//Sriyantha 06_02_2014
                    IF decCurrencyFactor = 0 THEN
                        decCurrencyFactor := 1;

                    //BillAmount:=ROUND("Sales Invoice Line".Quantity*("Sales Invoice Line"."Unit Price"+ItemChrg_),0.01,'=');//decTotItemChgLineAmount);//Sriyantha 06_02_2014
                    //BillAmount:="Sales Invoice Line".Quantity*("Sales Invoice Line"."Unit Price"+ROUND(ItemChrg_,0.01,'='));
                    BillAmount := Amount + (TotalChargeLinesValue * Quantity / Qty_);
                    //ValueLkr:=ROUND(BillAmount,0.01,'=')*ROUND(1/decCurrencyFactor,0.000000000000000001,'>'); //t
                    ValueLkr := ROUND(BillAmount / decCurrencyFactor, 0.01, '=');//ROUND(BillAmount*(1/decCurrencyFactor),0.000000000001,'=');
                    //MESSAGE('ValueLKR  '+FORMAT(BillAmount*1/decCurrencyFactor));
                    ExchRate := 1 / decCurrencyFactor;

                    Row := Row + 1;
                    EnterCell(Row, 1, FORMAT("Posting Date"), FALSE, FALSE, FALSE);
                    EnterCell(Row, 2, txtDim4AppValue, FALSE, FALSE, FALSE);
                    EnterCell(Row, 3, "Sales Invoice Header"."Sell-to Customer Name", FALSE, FALSE, FALSE);
                    //Sriyantha 05.05.2014
                    IF "Sales Invoice Header"."Shipping Agent Code" = '' THEN
                        EnterCell(Row, 4, '', FALSE, FALSE, FALSE)
                    ELSE BEGIN
                        ShipAgent_.RESET;
                        ShipAgent_.SETFILTER(Code, "Sales Invoice Header"."Shipping Agent Code");
                        IF ShipAgent_.FINDFIRST THEN
                            EnterCell(Row, 4, ShipAgent_.Name, FALSE, FALSE, FALSE);
                    END;
                    //EnterCell(Row,4,"Sales Invoice Header"."Shipping Agent Code",FALSE,FALSE,FALSE);
                    //Sriyantha 05.05.2014
                    EnterCell(Row, 5, txtDim3CGValue, FALSE, FALSE, FALSE);
                    EnterCell(Row, 6, txtCountryName, FALSE, FALSE, FALSE);
                    EnterCell(Row, 7, "Sales Invoice Line"."Document No.", FALSE, FALSE, FALSE);
                    EnterCell(Row, 8, "Sales Invoice Line".Description, FALSE, FALSE, FALSE);
                    EnterCell(Row, 9, "Sales Invoice Line"."Description 2", FALSE, FALSE, FALSE);
                    EnterCell(Row, 10, "Sales Invoice Header"."Shipment Method Code", FALSE, FALSE, FALSE);
                    EnterCell(Row, 11, FORMAT("Sales Invoice Line".Quantity), FALSE, FALSE, FALSE);
                    EnterCell(Row, 12, txtCurrencyCode[1], FALSE, FALSE, FALSE);
                    EnterCell(Row, 13, FORMAT(UPrice), FALSE, FALSE, FALSE);
                    EnterCell(Row, 14, FORMAT(BillAmount), FALSE, FALSE, FALSE);
                    EnterCell(Row, 15, FORMAT(ValueLkr), FALSE, FALSE, FALSE);   //---Shan
                    EnterCell(Row, 16, FORMAT(ExchRate), FALSE, FALSE, FALSE);
                    EnterCell(Row, 17, FORMAT("Sales Invoice Header"."Order No."), FALSE, FALSE, FALSE);                //----DH-JIT_18/11/2016
                    EnterCell(Row, 18, FORMAT("Sales Invoice Header"."Customer Order Number."), FALSE, FALSE, FALSE);   //----DH-JIT_18/11/2016

                    RecNo := RecNo + 1;
                    IF TotalRecNo <> 0 THEN
                        Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
                end;
            }

            trigger OnAfterGetRecord();
            var
                recDefaultDimension: Record "Default Dimension";
                recCustomer: Record Customer;
                recCountry: Record "Country/Region";
            begin

                IF "Sales Invoice Header"."Currency Factor" <= 0 THEN
                    decCurrencyFactor := 1.0
                ELSE
                    decCurrencyFactor := "Sales Invoice Header"."Currency Factor";
                //---shan
                IF "Currency Code" = '' THEN
                    currency.InitRoundingPrecision
                ELSE
                    currency.GET("Currency Code");



                WITH recDefaultDimension DO BEGIN
                    RESET;
                    SETRANGE("Table ID", 18);
                    SETRANGE("No.", "Sales Invoice Header"."Sell-to Customer No.");
                    IF FINDFIRST THEN
                        REPEAT

                            recDimVal.RESET;
                            recDimVal.SETRANGE("Dimension Code", recDefaultDimension."Dimension Code");
                            recDimVal.SETRANGE(Code, recDefaultDimension."Dimension Value Code");
                            IF recDimVal.FINDFIRST THEN
                                CASE "Dimension Code" OF
                                    'APPLICATION':
                                        txtDim3CGValue := recDimVal.Name;

                                    'CUSTOMER GROUP'://Sriyantha 05.05.2014 - 'CUSTOMERGROUP'
                                        txtDim4AppValue := recDimVal.Name;
                                END

                        UNTIL NEXT = 0;

                END;

                txtCountryName := '';  //Sriyantha 05.05.2014
                IF recCustomer.GET("Sales Invoice Header"."Sell-to Customer No.") THEN
                    IF NOT (recCustomer."Country/Region Code" = '') THEN
                        IF recCountry.GET(recCustomer."Country/Region Code") THEN
                            txtCountryName := recCountry.Name;

                Qty_ := 0;
                ItemChrg_ := 0;
                decTotItemChgLineAmount := 0;
                CLEAR(TotalChargeLinesValue);
                recSalesInvoiceLine.RESET;
                recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                //recSalesInvoiceLine.SETRANGE(Type,"Sales Invoice Line".Type::"Charge (Item)");//sriyantha 06_02_2014
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


                IF "Sales Invoice Header"."Currency Code" <> '' THEN
                    txtCurrencyCode[1] := "Sales Invoice Header"."Currency Code"
                ELSE
                    txtCurrencyCode[1] := txtCurrencyCode[2];
            end;

            trigger OnPostDataItem();
            begin
                Row := Row + 2;
                EnterCell(Row, 1, 'LOCAL', TRUE, FALSE, FALSE);
                RecNo := RecNo + 2;
                IF TotalRecNo <> 0 THEN
                    Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
            end;

            trigger OnPreDataItem();
            begin

                IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                    "Sales Invoice Header".SETFILTER("Posting Date", '%1..%2', date1, date2);
                END;



                Window.OPEN('Data Exporting' + '@1@@@@@@@@@@@@@@@@@@@@@\');
                Window.UPDATE(1, 0);
                TotalRecNo := (2 * ("Sales Invoice Line".COUNTAPPROX)) + ("Sales Cr.Memo Line".COUNTAPPROX);
                RecNo := 0;
                TempExcelBuffer.DELETEALL;
                CLEAR(TempExcelBuffer);
                EnterCell(1, 1, 'Details of Sales  - ' + txtCriteria, TRUE, FALSE, TRUE);
                EnterCell(2, 1, 'Invoice Date', TRUE, FALSE, FALSE);
                EnterCell(2, 2, 'Status', TRUE, FALSE, FALSE);
                EnterCell(2, 3, 'Name of Buyer', TRUE, FALSE, FALSE);
                EnterCell(2, 4, 'Dilivered to', TRUE, FALSE, FALSE);
                EnterCell(2, 5, 'Application', TRUE, FALSE, FALSE);
                EnterCell(2, 6, 'Country', TRUE, FALSE, FALSE);
                EnterCell(2, 7, 'Invoice No', TRUE, FALSE, FALSE);
                EnterCell(2, 8, 'Grade', TRUE, FALSE, FALSE);
                EnterCell(2, 9, 'Carbon %', TRUE, FALSE, FALSE);
                EnterCell(2, 10, 'Terms', TRUE, FALSE, TRUE);
                EnterCell(2, 11, 'Quantity M/T', TRUE, FALSE, FALSE);
                EnterCell(2, 12, 'Currency Code', TRUE, FALSE, FALSE);
                EnterCell(2, 13, 'Unit Price', TRUE, FALSE, FALSE);
                EnterCell(2, 14, 'Bill Amount', TRUE, FALSE, FALSE);
                EnterCell(2, 15, 'Value LKR', TRUE, FALSE, FALSE);
                EnterCell(2, 16, 'Exchange Rate', TRUE, FALSE, FALSE);
                EnterCell(2, 17, 'Sales Order No.', TRUE, FALSE, FALSE);         //----DH-JIT_18/11/2016
                EnterCell(2, 18, 'Customer Order No.', TRUE, FALSE, FALSE);      //----DH-JIT_18/11/2016

                Row := 3;
                Row := Row + 1;
                EnterCell(Row, 1, 'EXPORT', TRUE, FALSE, FALSE);
                RecNo := RecNo + 1;
                IF TotalRecNo <> 0 THEN
                    Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
            end;
        }
        dataitem("Sales Invoice Header1"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("Posting Date", "Gen. Bus. Posting Group") ORDER(Ascending) WHERE("Gen. Bus. Posting Group" = CONST('LOCAL'));
            dataitem("Sales Invoice Line1"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = CONST(Item));
                column(bdi1; "Posting Date")
                {
                }
                column(bdi2; txtDim4AppValue)
                {
                }
                column(bdi3; "Sales Invoice Header"."Sell-to Customer Name")
                {
                }
                column(bdi4; "Sales Invoice Header"."Shipping Agent Code")
                {
                }
                column(bdi5; txtDim3CGValue)
                {
                }
                column(bdi6; txtCountryName)
                {
                }
                column(bdi7; "Sales Invoice Line"."Document No.")
                {
                }
                column(bdi8; "Sales Invoice Line".Description)
                {
                }
                column(bdi9; "Sales Invoice Line"."Description 2")
                {
                }
                column(bdi10; "Sales Invoice Header"."Shipment Method Code")
                {
                }
                column(bdi11; txtCurrencyCode[1])
                {
                }
                column(bdi12; "Sales Invoice Line".Quantity)
                {
                }
                column(bdi13; UPrice)
                {
                }
                column(bdi14; BillAmount)
                {
                }
                column(bdi15; ValueLkr)
                {
                }
                column(bdi16; ExchRate)
                {
                }
                column(bdi17; "Sales Invoice Header"."Order No.")
                {
                }
                column(bdi18; "Sales Invoice Header"."Customer Order Number.")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    UPrice := "Sales Invoice Line1"."Unit Price" + ItemChrg_;//decTotItemChgLineAmount;//Sriyantha 06_02_2014
                    IF decCurrencyFactor = 0 THEN
                        decCurrencyFactor := 1;
                    //BillAmount:="Sales Invoice Line1".Quantity*("Sales Invoice Line1"."Unit Price"+ItemChrg_);//decTotItemChgLineAmount);//Sriyantha 06_02_2014
                    //BillAmount:=ROUND("Sales Invoice Line1".Quantity*("Sales Invoice Line1"."Unit Price"+ItemChrg_),0.01,'=');
                    //ValueLkr:=BillAmount*(1/decCurrencyFactor);
                    //BillAmount:="Sales Invoice Line1".Quantity*("Sales Invoice Line1"."Unit Price"+ROUND(ItemChrg_,0.01,'='));
                    BillAmount := Amount + (TotalChargeLinesValue * Quantity / Qty_);
                    //ValueLkr:=ROUND(BillAmount,0.01,'=')*ROUND(1/decCurrencyFactor,0.000000000000000001,'>'); //tn  Shan  SH
                    ValueLkr := ROUND(BillAmount / decCurrencyFactor, 0.01, '='); //t

                    ExchRate := 1 / decCurrencyFactor;
                    Row := Row + 1;
                    EnterCell(Row, 1, FORMAT("Posting Date"), FALSE, FALSE, FALSE);
                    EnterCell(Row, 2, txtDim4AppValue, FALSE, FALSE, FALSE);
                    EnterCell(Row, 3, "Sales Invoice Header1"."Sell-to Customer Name", FALSE, FALSE, FALSE);
                    //Sriyantha 05.05.2014
                    IF "Sales Invoice Header1"."Shipping Agent Code" = '' THEN
                        EnterCell(Row, 4, '', FALSE, FALSE, FALSE)
                    ELSE BEGIN
                        ShipAgent_.RESET;
                        ShipAgent_.SETFILTER(Code, "Sales Invoice Header1"."Shipping Agent Code");
                        IF ShipAgent_.FINDFIRST THEN
                            EnterCell(Row, 4, ShipAgent_.Name, FALSE, FALSE, FALSE);
                    END;
                    //EnterCell(Row,4,"Sales Invoice Header1"."Shipping Agent Code",FALSE,FALSE,FALSE);
                    //Sriyantha 05.05.2014
                    EnterCell(Row, 5, txtDim3CGValue, FALSE, FALSE, FALSE);
                    EnterCell(Row, 6, txtCountryName, FALSE, FALSE, FALSE);
                    EnterCell(Row, 7, "Sales Invoice Line1"."Document No.", FALSE, FALSE, FALSE);
                    EnterCell(Row, 8, "Sales Invoice Line1".Description, FALSE, FALSE, FALSE);
                    EnterCell(Row, 9, "Sales Invoice Line1"."Description 2", FALSE, FALSE, FALSE);
                    EnterCell(Row, 10, "Sales Invoice Header1"."Shipment Method Code", FALSE, FALSE, FALSE);
                    EnterCell(Row, 11, FORMAT("Sales Invoice Line1".Quantity), FALSE, FALSE, FALSE);
                    EnterCell(Row, 12, txtCurrencyCode[1], FALSE, FALSE, FALSE);
                    EnterCell(Row, 13, FORMAT(UPrice), FALSE, FALSE, FALSE);
                    EnterCell(Row, 14, FORMAT(BillAmount), FALSE, FALSE, FALSE);
                    EnterCell(Row, 15, FORMAT(ValueLkr), FALSE, FALSE, FALSE);
                    EnterCell(Row, 16, FORMAT(ExchRate), FALSE, FALSE, FALSE);
                    EnterCell(Row, 17, "Sales Invoice Header1"."Order No.", FALSE, FALSE, FALSE);                //----DH-JIT_18/11/2016
                    EnterCell(Row, 18, "Sales Invoice Header1"."Customer Order Number.", FALSE, FALSE, FALSE);   //----DH-JIT_18/11/2016

                    RecNo := RecNo + 1;
                    IF TotalRecNo <> 0 THEN
                        Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
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



                WITH recDefaultDimension DO BEGIN
                    RESET;
                    SETRANGE("Table ID", 18);
                    SETRANGE("No.", "Sales Invoice Header1"."Sell-to Customer No.");
                    IF FINDFIRST THEN
                        REPEAT

                            recDimVal.RESET;
                            recDimVal.SETRANGE("Dimension Code", recDefaultDimension."Dimension Code");
                            recDimVal.SETRANGE(Code, recDefaultDimension."Dimension Value Code");
                            IF recDimVal.FINDFIRST THEN
                                CASE "Dimension Code" OF
                                    'APPLICATION':
                                        txtDim3CGValue := recDimVal.Name;

                                    'CUSTOMER GROUP': //Sriyantha 05.05.2014  -'CUSTOMERGROUP'
                                        txtDim4AppValue := recDimVal.Name;
                                END

                        UNTIL NEXT = 0;

                END;
                txtCountryName := '';//Sriyantha 05.05.2014
                IF recCustomer.GET("Sales Invoice Header1"."Sell-to Customer No.") THEN
                    IF NOT (recCustomer."Country/Region Code" = '') THEN
                        IF recCountry.GET(recCustomer."Country/Region Code") THEN
                            txtCountryName := recCountry.Name;
                //Qty_ :=0;
                //decTotItemChgLineAmount:=0;
                //recSalesInvoiceLine.RESET;
                //recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                //recSalesInvoiceLine.SETRANGE(Type,"Sales Invoice Line".Type::"Charge (Item)");//sriyantha 06_02_2014
                //IF recSalesInvoiceLine.FINDFIRST THEN
                //  REPEAT
                //    IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::"Charge (Item)" THEN//sriyantha 06_02_2014
                //      decTotItemChgLineAmount:=decTotItemChgLineAmount+recSalesInvoiceLine."Line Amount"
                //    ELSE IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item THEN //sriyantha 06_02_2014
                //      Qty_ += recSalesInvoiceLine.Quantity;  //sriyantha 06_02_2014
                //  UNTIL recSalesInvoiceLine.NEXT=0;
                //    decTotItemChgLineAmount := decTotItemChgLineAmount/Qty_;//sriyantha 06_02_2014

                Qty_ := 0;
                ItemChrg_ := 0;
                decTotItemChgLineAmount := 0;
                CLEAR(TotalChargeLinesValue);
                recSalesInvoiceLine.RESET;
                recSalesInvoiceLine.SETRANGE("Document No.", "No.");
                //recSalesInvoiceLine.SETRANGE(Type,"Sales Invoice Line".Type::"Charge (Item)");//sriyantha 06_02_2014
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


                IF "Sales Invoice Header1"."Currency Code" <> '' THEN
                    txtCurrencyCode[1] := "Sales Invoice Header1"."Currency Code"
                ELSE
                    txtCurrencyCode[1] := txtCurrencyCode[2];
            end;

            trigger OnPostDataItem();
            begin

                Row := Row + 3;
                EnterCell(Row, 1, 'DETAILS LINES OF CREDIT MEMOS', TRUE, FALSE, FALSE);
                RecNo := RecNo + 3;
                IF TotalRecNo <> 0 THEN
                    Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
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
            DataItemTableView = SORTING("Posting Date");
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLinkReference = "Sales Cr.Memo Header";
                DataItemLink = "Document No." = FIELD("No.");
                //DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = FILTER(Item | ' ' | 'Charge (Item)'));
                DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = FILTER(Item | " " | "Charge (Item)")); //PS
                column(cdi1; "Posting Date")
                {
                }
                column(cdi3; "Gen. Bus. Posting Group")
                {
                }
                column(cdi4; "Sales Cr.Memo Header"."Sell-to Customer Name")
                {
                }
                column(cdi7; "Sales Cr.Memo Line"."Document No.")
                {
                }
                column(cdi8; "Sales Cr.Memo Line".Description)
                {
                }
                column(cdi9; "Sales Cr.Memo Line"."Description 2")
                {
                }
                column(cdi11; "Sales Cr.Memo Header"."Currency Code")
                {
                }
                column(cdi12; "Sales Cr.Memo Line".Quantity)
                {
                }
                column(cdi13; "Sales Cr.Memo Line"."Unit Price")
                {
                }
                column(cdi14; "Sales Cr.Memo Line"."Line Amount")
                {
                }

                trigger OnAfterGetRecord();
                begin

                    Row := Row + 1;
                    EnterCell(Row, 1, FORMAT("Posting Date"), FALSE, FALSE, FALSE);
                    EnterCell(Row, 3, "Gen. Bus. Posting Group", FALSE, FALSE, FALSE);
                    EnterCell(Row, 4, "Sales Cr.Memo Header"."Sell-to Customer Name", FALSE, FALSE, FALSE);
                    EnterCell(Row, 7, "Sales Cr.Memo Line"."Document No.", FALSE, FALSE, FALSE);
                    EnterCell(Row, 8, "Sales Cr.Memo Line".Description, FALSE, FALSE, FALSE);
                    EnterCell(Row, 9, "Sales Cr.Memo Line"."Description 2", FALSE, FALSE, FALSE);
                    EnterCell(Row, 11, "Sales Cr.Memo Header"."Currency Code", FALSE, FALSE, FALSE);
                    EnterCell(Row, 12, FORMAT("Sales Cr.Memo Line".Quantity), FALSE, FALSE, FALSE);
                    EnterCell(Row, 13, FORMAT("Sales Cr.Memo Line"."Unit Price"), FALSE, FALSE, FALSE);
                    EnterCell(Row, 14, FORMAT("Sales Cr.Memo Line"."Line Amount"), FALSE, FALSE, FALSE);
                    RecNo := RecNo + 1;
                    IF TotalRecNo <> 0 THEN
                        Window.UPDATE(1, ROUND(RecNo / TotalRecNo * 10000, 1));
                end;
            }

            trigger OnPostDataItem();
            begin

                Window.CLOSE;
                // TempExcelBuffer.CreateBook('Details of Sales');
                // TempExcelBuffer.CreateBookAndOpenExcel('Details of Sales', 'Details of Sales', COMPANYNAME, USERID);
                TempExcelBuffer.CreateNewBook('Details of Sales');
                TempExcelBuffer.WriteSheet('Details of Sales', COMPANYNAME, USERID);
                TempExcelBuffer.CloseBook();
                TempExcelBuffer.SetFriendlyFilename(StrSubstNo('Details of Sales %1 & &2', CurrentDateTime, UserId));
                TempExcelBuffer.OpenExcel();
            end;

            trigger OnPreDataItem();
            begin

                IF ((date1 <> 0D) AND (date2 <> 0D)) THEN BEGIN
                    "Sales Cr.Memo Header".SETFILTER("Posting Date", '%1..%2', date1, date2);
                END;
            end;
        }
    }

    requestpage
    {

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

    trigger OnPreReport();
    begin

        txtCriteria := 'Date Range :' + FORMAT(date1) + ' ' + FORMAT(date2);
        IF recGLSetup.GET THEN
            txtCurrencyCode[2] := recGLSetup."LCY Code";
    end;

    var
        decCurrencyFactor: Decimal;
        txtDim3CGValue: Text[50];
        txtDim4AppValue: Text[50];
        txtCountryName: Text[50];
        TempExcelBuffer: Record "Excel Buffer";
        Window: Dialog;
        Row: Integer;
        TotalRecNo: BigInteger;
        RecNo: Integer;
        recSalesInvoiceLine: Record "Sales Invoice Line";
        decTotItemChgLineAmount: Decimal;
        txtCriteria: Text[250];
        recDimVal: Record "Dimension Value";
        date1: Date;
        date2: Date;
        txtCurrencyCode: array[2] of Code[20];
        recGLSetup: Record "General Ledger Setup";
        UPrice: Decimal;
        BillAmount: Decimal;
        ValueLkr: Decimal;
        ExchRate: Decimal;
        ShipAgent_: Record "Shipping Agent";
        Qty_: Decimal;
        ItemChrg_: Decimal;
        CurrExchRate: Record "Currency Exchange Rate";
        ExchRateCalc: Decimal;
        currency: Record Currency;
        TotalChargeLinesValue: Decimal;
        CustCard: Record Customer;

    procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean; Italic: Boolean; Underline: Boolean);
    begin
        WITH TempExcelBuffer DO BEGIN
            INIT;
            VALIDATE("Row No.", RowNo);
            VALIDATE("Column No.", ColumnNo);
            "Cell Value as Text" := CellValue;
            Formula := '';
            Bold := Bold;
            Italic := Italic;
            Underline := Underline;
            INSERT;
        END
    end;
}


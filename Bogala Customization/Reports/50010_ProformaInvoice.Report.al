report 50010 "Proforma Invoice"
{
    //DefaultLayout = RDLC;
    RDLCLayout = './Reports/Proforma Invoice.rdl';
    Caption = 'Sales - Quote';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Quote));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            //ReqFilterHeading = 'Proforma Invoice';
            column(DocType_SalesHeader; "Document Type")
            { }
            column(No_SalesHeader; "No.")
            { }
            column(SalesLineVATIdentifierCaption; SalesLineVATIdentifierCaptionLbl)
            { }
            column(PaymentTermsDescriptionCaption; PaymentTermsDescriptionCaptionLbl)
            { }
            column(ShipmentMethodDescriptionCaption; ShipmentMethodDescriptionCaptionLbl)
            { }
            column(CompanyInfoHomePageCaption; CompanyInfoHomePageCaptionLbl)
            { }
            column(CompanyInfoEmailCaption; CompanyInfoEmailCaptionLbl)
            { }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
            { }
            column(SalesLineAllowInvoiceDiscCaption; SalesLineAllowInvoiceDiscCaptionLbl)
            { }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    { }
                    column(PaymentTermsDescription; PaymentTerms.Description)
                    { }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    { }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    { }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    { }
                    column(SalesCopyText; STRSUBSTNO(Text004, CopyText))
                    { }
                    column(CustAddr1; CustAddr[1])
                    { }
                    column(CompanyAddr1; CompanyAddr[1])
                    { }
                    column(CustAddr2; CustAddr[2])
                    { }
                    column(CompanyAddr2; CompanyAddr[2])
                    { }
                    column(CustAddr3; CustAddr[3])
                    { }
                    column(CompanyAddr3; CompanyAddr[3])
                    { }
                    column(CustAddr4; CustAddr[4])
                    { }
                    column(CompanyAddr4; CompanyInfo."Post Code")
                    { }
                    column(CustAddr5; CustAddr[5])
                    { }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    { }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    { }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    { }
                    column(CustAddr6; CustAddr[6])
                    { }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    { }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    { }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    { }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    { }
                    column(BilltoCustNo_SalesHeader; "Sales Header"."Bill-to Customer No.")
                    { }
                    column(DocDate_SalesHeader; FORMAT("Sales Header"."Document Date", 0, 4))
                    { }
                    column(VATNoText; VATNoText)
                    { }
                    column(VATRegNo_SalesHeader; "Sales Header"."VAT Registration No.")
                    { }
                    column(ShipmentDate_SalesHeader; FORMAT("Sales Header"."Shipment Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    { }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    { }
                    column(No1_SalesHeader; "Sales Header"."No.")
                    { }
                    column(ReferenceText; ReferenceText)
                    { }
                    column(YourReference_SalesHeader; "Sales Header"."Your Reference")
                    { }
                    column(CustAddr7; CustAddr[7])
                    { }
                    column(CustAddr8; CustAddr[8])
                    { }
                    column(CompanyAddr5; CompanyAddr[5])
                    { }
                    column(CompanyAddr6; CompanyAddr[6])
                    { }
                    column(PricesIncludingVAT_SalesHdr; "Sales Header"."Prices Including VAT")
                    { }
                    column(PageCaption; STRSUBSTNO(Text005, ''))
                    { }
                    column(OutputNo; OutputNo)
                    { }
                    column(PricesInclVATYesNo_SalesHdr; FORMAT("Sales Header"."Prices Including VAT"))
                    { }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    { }
                    column(CompanyInfoVATRegNoCaption; CompanyInfoVATRegNoCaptionLbl)
                    { }
                    column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                    { }
                    column(CompanyInfoBankNameCaption; CompanyInfoBankNameCaptionLbl)
                    { }
                    column(CompanyInfoBankAccountNoCaption; CompanyInfoBankAccountNoCaptionLbl)
                    { }
                    column(SalesHeaderShipmentDateCaption; SalesHeaderShipmentDateCaptionLbl)
                    { }
                    column(SalesHeaderNoCaption; SalesHeaderNoCaptionLbl)
                    { }
                    column(BilltoCustNo_SalesHeaderCaption; "Sales Header".FIELDCAPTION("Bill-to Customer No."))
                    { }
                    column(PricesIncludingVAT_SalesHdrCaption; "Sales Header".FIELDCAPTION("Prices Including VAT"))
                    { }
                    column(Currency_Code; "Sales Header"."Currency Code")
                    { }
                    column(Destination; "Sales Header".Destination)
                    { }
                    column(Payment_Terms_Code; "Sales Header"."Payment Terms Code")
                    { }
                    column(SWIFT_Code; CompanyInfo."SWIFT Code")
                    { }
                    column(Bank_Code; "Sales Header"."Bank Code")
                    { }
                    column(Bank_Name; BankCard.Name)
                    { }
                    column(Bank_Address; BankCard.Address)
                    { }
                    column(Bank_Address2; BankCard."Address 2")
                    { }
                    column(Bank_City; BankCard.City)
                    { }
                    column(Bank_Contact; BankCard.Contact)
                    { }
                    column(Bank_Account_No; BankCard."Bank Account No.")
                    { }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        { }

                        trigger OnAfterGetRecord();
                        begin
                            IF Number = 1 THEN BEGIN
                                IF NOT DimSetEntry1.FINDSET THEN
                                    CurrReport.BREAK;
                            END ELSE
                                IF NOT Continue THEN
                                    CurrReport.BREAK;

                            CLEAR(DimText);
                            Continue := FALSE;
                            REPEAT
                                OldDimText := DimText;
                                IF DimText = '' THEN
                                    DimText := STRSUBSTNO('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                ELSE
                                    DimText :=
                                      STRSUBSTNO(
                                        '%1, %2 %3', DimText, DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                    DimText := OldDimText;
                                    Continue := TRUE;
                                    EXIT;
                                END;
                            UNTIL DimSetEntry1.NEXT = 0;
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowInternalInfo THEN
                                CurrReport.BREAK;
                        end;
                    }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem();
                        begin
                            CurrReport.BREAK;
                        end;
                    }
                    dataitem(RoundLoop; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(DimValueName; DimValueName)
                        { }
                        column(LineAmt_SalesLine; SalesLine."Line Amount")
                        {
                            AutoFormatType = 1;
                            AutoFormatExpression = "Sales Header"."Currency Code";
                        }
                        column(No_SalesLine; "Sales Line"."No.")
                        { }
                        column(Desc_SalesLine; "Sales Line".Description)
                        { }
                        column(Quantity_SalesLine; "Sales Line".Quantity)
                        { }
                        column(UnitofMeasure_SalesLine; "Sales Line"."Unit of Measure")
                        { }
                        column(LineAmt1_SalesLine; "Sales Line"."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(UnitPrice_SalesLine; "Sales Line"."Unit Price")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(LineDiscount_SalesLine; "Sales Line"."Line Discount %")
                        { }
                        column(AllowInvoiceDisc_SalesLine; "Sales Line"."Allow Invoice Disc.")
                        {
                            IncludeCaption = false;
                        }
                        column(VATIdentifier_SalesLine; "Sales Line"."VAT Identifier")
                        { }
                        column(Packing_Comm; "Sales Line"."Packing Comm.")
                        { }
                        column(Type_SalesLine; FORMAT("Sales Line".Type))
                        { }
                        column(No1_SalesLine; "Sales Line"."Line No.")
                        { }
                        column(AllowInvoiceDisYesNo; FORMAT("Sales Line"."Allow Invoice Disc."))
                        { }
                        column(InvDiscountAmount_SalesLine; -SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        { }
                        column(DiscountAmt_SalesLine; SalesLine."Line Amount" - SalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtTxt; VATAmountLine.VATAmountText)
                        { }
                        column(TotalExclVATText; TotalExclVATText)
                        { }
                        column(TotalInclVATText; TotalInclVATText)
                        { }
                        column(VATAmount; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATDiscountAmount; -VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        { }
                        column(SalesLineLineDiscCaption; SalesLineLineDiscCaptionLbl)
                        { }
                        column(AmountCaption; AmountCaptionLbl)
                        { }
                        column(SalesLineInvDiscAmtCaption; SalesLineInvDiscAmtCaptionLbl)
                        { }
                        column(Shipping_Marks; "Sales Line"."Shipping Marks")
                        { }
                        column(No_of_Packages; "Sales Line"."No.of Packages")
                        { }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        { }
                        column(VATDiscountAmountCaption; VATDiscountAmountCaptionLbl)
                        { }
                        column(No_SalesLineCaption; "Sales Line".FIELDCAPTION("No."))
                        { }
                        column(Desc_SalesLineCaption; "Sales Line".FIELDCAPTION(Description))
                        { }
                        column(Quantity_SalesLineCaption; "Sales Line".FIELDCAPTION(Quantity))
                        { }
                        column(UnitofMeasure_SalesLineCaption; "Sales Line".FIELDCAPTION("Unit of Measure"))
                        { }
                        column(TotSVat; TotSVat)
                        { }
                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText_DimnLoop2; DimText)
                            { }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            { }

                            trigger OnAfterGetRecord();
                            begin
                                IF Number = 1 THEN BEGIN
                                    IF NOT DimSetEntry2.FINDSET THEN
                                        CurrReport.BREAK;
                                END ELSE
                                    IF NOT Continue THEN
                                        CurrReport.BREAK;

                                CLEAR(DimText);
                                Continue := FALSE;
                                REPEAT
                                    OldDimText := DimText;
                                    IF DimText = '' THEN
                                        DimText := STRSUBSTNO('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    ELSE
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    IF STRLEN(DimText) > MAXSTRLEN(OldDimText) THEN BEGIN
                                        DimText := OldDimText;
                                        Continue := TRUE;
                                        EXIT;
                                    END;
                                UNTIL DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPreDataItem();
                            begin
                                IF NOT ShowInternalInfo THEN
                                    CurrReport.BREAK;

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Sales Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF Number = 1 THEN
                                SalesLine.FIND('-')
                            ELSE
                                SalesLine.NEXT;
                            "Sales Line" := SalesLine;

                            IF NOT "Sales Header"."Prices Including VAT" AND
                               (SalesLine."VAT Calculation Type" = SalesLine."VAT Calculation Type"::"Full VAT")
                            THEN
                                SalesLine."Line Amount" := 0;

                            IF (SalesLine.Type = SalesLine.Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "Sales Line"."No." := '';

                            RVTaxDetail.RESET;
                            RVTaxDetail.SETRANGE("Tax Jurisdiction Code", SalesLine."Tax Group Code");
                            RVTaxDetail.SETRANGE("Tax Group Code", SalesLine."Tax Group Code");
                            IF RVTaxDetail.FINDFIRST THEN
                                TotSVat += "Sales Line"."Line Amount" * (RVTaxDetail."Tax Below Maximum" / 100);
                        end;

                        trigger OnPostDataItem();
                        begin
                            SalesLine.DELETEALL;
                        end;

                        trigger OnPreDataItem();
                        begin
                            MoreLines := SalesLine.FIND('+');
                            WHILE MoreLines AND (SalesLine.Description = '') AND (SalesLine."Description 2" = '') AND
                                  (SalesLine."No." = '') AND (SalesLine.Quantity = 0) AND
                                  (SalesLine.Amount = 0)
                            DO
                                MoreLines := SalesLine.NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SalesLine.SETRANGE("Line No.", 0, SalesLine."Line No.");
                            SETRANGE(Number, 1, SalesLine.COUNT);
                            CurrReport.CREATETOTALS(SalesLine."Line Amount", SalesLine."Inv. Discount Amount");

                            CLEAR(DimValueName);
                            DimValue.RESET;
                            DimValue.SETRANGE(Code, SalesLine."Shortcut Dimension 1 Code");
                            IF DimValue.FIND('-') THEN
                                DimValueName := DimValue.Name;
                            // = Tax
                        end;
                    }
                    dataitem(VATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATBase_VATAmtLine; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmt_VATAmtLine; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmount_VATAmtLine; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(InvDiscBaseAmt_VATAmtLine; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(InvoiceDiscAmt_VATAmtLine; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VAT_VATAmtLine; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIdentifier_VATAmtLine; VATAmountLine."VAT Identifier")
                        { }
                        column(VATAmountLineVATCaption; VATAmountLineVATCaptionLbl)
                        { }
                        column(VATBaseCaption; VATBaseCaptionLbl)
                        { }
                        column(VATAmtCaption; VATAmtCaptionLbl)
                        { }
                        column(VATAmountSpecificationCaption; VATAmountSpecificationCaptionLbl)
                        { }
                        column(LineAmtCaption; LineAmtCaptionLbl)
                        { }
                        column(InvoiceDiscBaseAmtCaption; InvoiceDiscBaseAmtCaptionLbl)
                        { }
                        column(InvoiceDiscAmtCaption; InvoiceDiscAmtCaptionLbl)
                        { }
                        column(TotalCaption; TotalCaptionLbl)
                        { }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF VATAmount = 0 THEN
                                CurrReport.BREAK;
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VATCounterLCY; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALExchRate; VALExchRate)
                        { }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        { }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATCtrl_VATAmtLine; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIdentifierCtrl_VATAmtLine; VATAmountLine."VAT Identifier")
                        { }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                                  "Sales Header"."Order Date", "Sales Header"."Currency Code",
                                  VATAmountLine."VAT Base", "Sales Header"."Currency Factor"));
                            VALVATAmountLCY := ROUND(CurrExchRate.ExchangeAmtFCYToLCY(
                                  "Sales Header"."Order Date", "Sales Header"."Currency Code",
                                  VATAmountLine."VAT Amount", "Sales Header"."Currency Factor"));
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               ("Sales Header"."Currency Code" = '') OR
                               (VATAmountLine.GetTotalVATAmount = 0)
                            THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VALVATBaseLCY, VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text008 + Text009
                            ELSE
                                VALSpecLCYHeader := Text008 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Header"."Order Date", "Sales Header"."Currency Code", 1);
                            VALExchRate := STRSUBSTNO(Text010, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; Integer)
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    }
                    dataitem(Total2; Integer)
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesHeader; "Sales Header"."Sell-to Customer No.")
                        { }
                        column(ShipToAddr1; ShipToAddr[1])
                        { }
                        column(ShipToAddr2; ShipToAddr[2])
                        { }
                        column(ShipToAddr3; ShipToAddr[3])
                        { }
                        column(ShipToAddr4; ShipToAddr[4])
                        { }
                        column(ShipToAddr5; ShipToAddr[5])
                        { }
                        column(ShipToAddr6; ShipToAddr[6])
                        { }
                        column(ShipToAddr7; ShipToAddr[7])
                        { }
                        column(ShipToAddr8; ShipToAddr[8])
                        { }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        { }
                        column(SelltoCustNo_SalesHeaderCaption; "Sales Header".FIELDCAPTION("Sell-to Customer No."))
                        { }

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                var
                    SalesPost: Codeunit "Sales-Post";
                begin
                    CLEAR(SalesLine);
                    CLEAR(SalesPost);
                    SalesLine.DELETEALL;
                    VATAmountLine.DELETEALL;
                    SalesPost.GetSalesLines("Sales Header", SalesLine, 0);
                    SalesLine.CalcVATAmountLines(0, "Sales Header", SalesLine, VATAmountLine);
                    SalesLine.UpdateVATOnLines(0, "Sales Header", SalesLine, VATAmountLine);
                    VATAmount := VATAmountLine.GetTotalVATAmount;
                    VATBaseAmount := VATAmountLine.GetTotalVATBase;
                    VATDiscountAmount :=
                      VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code", "Sales Header"."Prices Including VAT");
                    TotalAmountInclVAT := VATAmountLine.GetTotalAmountInclVAT;

                    IF Number > 1 THEN BEGIN
                        CopyText := Text003;
                        OutputNo += 1;
                    END;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPostDataItem();
                begin
                    IF Print THEN
                        SalesCountPrinted.RUN("Sales Header");
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord();
            var
                "Sell-to Country": Text[50];
            begin
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");       //MR

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF "Salesperson Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    SalesPersonText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Salesperson Code");
                    SalesPersonText := Text000;
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text002, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text006, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text002, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text006, "Currency Code");
                END;
                FormatAddr.SalesHeaderBillTo(CustAddr, "Sales Header");

                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                END;
                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                END;

                IF Country.GET("Sell-to Country/Region Code") THEN
                    "Sell-to Country" := Country.Name;
                FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, "Sales Header");
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                    IF (ShipToAddr[i] <> CustAddr[i]) AND (ShipToAddr[i] <> '') AND (ShipToAddr[i] <> "Sell-to Country") THEN
                        ShowShippingAddr := TRUE;

                IF Print THEN BEGIN
                    IF ArchiveDocument THEN
                        ArchiveManagement.StoreSalesDocument("Sales Header", LogInteraction);

                    IF LogInteraction THEN BEGIN
                        CALCFIELDS("No. of Archived Versions");
                        IF "Bill-to Contact No." <> '' THEN
                            SegManagement.LogDocument(
                              1, "No.", "Doc. No. Occurrence",
                              "No. of Archived Versions", DATABASE::Contact, "Bill-to Contact No.",
                              "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.")
                        ELSE
                            SegManagement.LogDocument(
                              1, "No.", "Doc. No. Occurrence",
                              "No. of Archived Versions", DATABASE::Customer, "Bill-to Customer No.",
                              "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.");
                    END;
                END;
                MARK(TRUE);
                IF BankCard.GET("Bank Code") THEN;
            end;

            trigger OnPostDataItem();
            var
                ToDo: Record "To-do";
            begin
                MARKEDONLY := TRUE;
                COMMIT;
                CurrReport.LANGUAGE := GLOBALLANGUAGE;
                IF FIND('-') AND ToDo.WRITEPERMISSION THEN
                    IF Print AND (NoOfRecords = 1) THEN
                        IF CONFIRM(Text007) THEN
                            CreateTask();
            end;

            trigger OnPreDataItem();
            begin
                NoOfRecords := COUNT;
                Print := Print OR NOT CurrReport.PREVIEW;
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
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of Copies';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Internal Information';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = All;
                        Caption = 'Archive Document';

                        trigger OnValidate();
                        begin
                            IF NOT ArchiveDocument THEN
                                LogInteraction := FALSE;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = All;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;

                        trigger OnValidate();
                        begin
                            IF LogInteraction THEN
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            LogInteractionEnable := TRUE;
        end;

        trigger OnOpenPage();
        begin
            //ArchiveDocument := SalesSetup."Archive Quotes and Orders";    //MR
            LogInteraction := SegManagement.FindInteractTmplCode(1) <> '';

            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
        CompanyInfo.GET;
        SalesSetup.GET;

        CASE SalesSetup."Logo Position on Documents" OF
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                BEGIN
                    CompanyInfo3.GET;
                    CompanyInfo3.CALCFIELDS(Picture);
                END;
            SalesSetup."Logo Position on Documents"::Center:
                BEGIN
                    CompanyInfo1.GET;
                    CompanyInfo1.CALCFIELDS(Picture);
                END;
            SalesSetup."Logo Position on Documents"::Right:
                BEGIN
                    CompanyInfo2.GET;
                    CompanyInfo2.CALCFIELDS(Picture);
                END;
        END;
    end;

    var
        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Sales - Quote %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        VATAmountLine: Record "VAT Amount Line" temporary;
        SalesLine: Record "Sales Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        Language: Record "Language";
        Country: Record "Country/Region";
        CurrExchRate: Record "Currency Exchange Rate";
        SalesCountPrinted: Codeunit "Sales-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit "SegManagement";
        ArchiveManagement: Codeunit "ArchiveManagement";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        i: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        Text007: Label 'Do you want to create a follow-up to-do?';
        NoOfRecords: Integer;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        Text008: Label '"VAT Amount Specification in "';
        Text009: Label 'Local Currency';
        Text010: Label 'Exchange rate: %1/%2';
        OutputNo: Integer;
        Print: Boolean;
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoVATRegNoCaptionLbl: Label 'VAT Registration No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCaptionLbl: Label 'Bank';
        CompanyInfoBankAccountNoCaptionLbl: Label 'Account No.';
        SalesHeaderShipmentDateCaptionLbl: Label 'Shipment Date';
        SalesHeaderNoCaptionLbl: Label 'Quote No.';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        SalesLineLineDiscCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        SalesLineInvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        VATDiscountAmountCaptionLbl: Label 'Payment Discount on VAT';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATAmountLineVATCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmtCaptionLbl: Label 'VAT Amount';
        VATAmountSpecificationCaptionLbl: Label 'VAT Amount Specification';
        LineAmtCaptionLbl: Label 'Line Amount';
        InvoiceDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        InvoiceDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        TotalCaptionLbl: Label 'Total';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        SalesLineVATIdentifierCaptionLbl: Label 'VAT Identifier';
        PaymentTermsDescriptionCaptionLbl: Label 'Payment Terms';
        ShipmentMethodDescriptionCaptionLbl: Label 'Shipment Method';
        CompanyInfoHomePageCaptionLbl: Label 'Home Page';
        CompanyInfoEmailCaptionLbl: Label 'E-Mail';
        DocumentDateCaptionLbl: Label 'Document Date';
        SalesLineAllowInvoiceDiscCaptionLbl: Label 'Allow Invoice Discount';
        DimValue: Record "Dimension Value";
        DimValueName: Text[60];
        "Nbt%": Decimal;
        "Vat%": Decimal;
        LineNBT: Decimal;
        LineVAT: Decimal;
        RVTaxDetail: Record "Tax Detail";
        TaxTxt: array[2] of Code[10];
        TotSVat: Decimal;
        LineSVAT: Decimal;
        TotNbt: Decimal;
        TaxPer: array[2] of Decimal;
        TotVat: Decimal;
        BankCard: Record "Bank Account";

    procedure InitializeRequest(NoOfCopiesFrom: Integer; ShowInternalInfoFrom: Boolean; ArchiveDocumentFrom: Boolean; LogInteractionFrom: Boolean; PrintFrom: Boolean);
    begin
        NoOfCopies := NoOfCopiesFrom;
        ShowInternalInfo := ShowInternalInfoFrom;
        ArchiveDocument := ArchiveDocumentFrom;
        LogInteraction := LogInteractionFrom;
        Print := PrintFrom;
    end;
}


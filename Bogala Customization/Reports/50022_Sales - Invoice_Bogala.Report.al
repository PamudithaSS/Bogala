report 50022 "Sales - Invoice - Bogala"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Sales - Invoice Bogala.rdl';

    Caption = 'Sales - Invoice';
    Permissions = TableData 7190 = rimd;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            //ReqFilterHeading = 'Posted Sales Invoice';
            column(CompanyInfoPicture; CompanyInfo.Picture)
            { }
            column(No_SalesInvHdr; "No.")
            { }
            column(InvDiscountAmtCaption; InvDiscountAmtCaptionLbl)
            { }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
            { }
            column(PaymentTermsDescCaption; PaymentTermsDescCaptionLbl)
            { }
            column(ShptMethodDescCaption; ShptMethodDescCaptionLbl)
            { }
            column(VATPercentageCaption; VATPercentageCaptionLbl)
            { }
            column(TotalCaption; TotalCaptionLbl)
            { }
            column(VATBaseCaption; VATBaseCaptionLbl)
            { }
            column(VATAmtCaption; VATAmtCaptionLbl)
            { }
            column(VATIdentifierCaption; VATIdentifierCaptionLbl)
            { }
            column(HomePageCaption; HomePageCaptionLbl)
            { }
            column(EMailCaption; EMailCaptionLbl)
            { }
            column(recBankNo; recBank."No.")
            { }
            column(recBankName; recBank.Name)
            { }
            column(recBankAddress; recBank.Address)
            { }
            column(recBankAddress2; recBank."Address 2")
            { }
            column(recBankPostCode; recBank."Post Code")
            { }
            column(recBankBankAccountNo; recBank."Bank Account No.")
            { }
            column(recBankSWIFTCode; recBank."SWIFT Code")
            { }
            column(SalesLineCommentNo; SalesLineComment."No.")
            { }
            column(txtPurchaseComment; txtSalesComment)
            { }
            column(recpaytermdis; recPaymentterm.Description)
            { }
            column(recshipagentcodeName; recshipagentcode.Name)
            { }
            column(DimensionValueName; Rec349.Name)
            { }
            column(CustomerPostCode; Customer_."Post Code")
            { }
            column(SVATRegistrationNo; Customer_A."SVAT Registration No.")
            { }
            column(CountryName; Country_.Name)
            {
            }
            column(TotGrossWeight; TotGrossWeight)
            {
            }
            column(TotNetWeight; TotNetWeight)
            {
            }
            column(InvoiceHeader; InvoiceHeader)
            {
            }
            column(CheckLKR; CheckLKR)
            {
            }
            column(CheckWeightPrint; CheckWeightPrint)
            {
            }
            column(CheckPackingList; CheckPackingList)
            {
            }
            column(FOBValue; FOBValue)
            {
            }
            column(FOBLKR; FOBLKR)
            {
            }
            column(CheckCurrUSD; CheckCurrUSD)
            {
            }
            column(USDAmount; USDAmount)
            {
            }
            column(PackingComment; "Sales Invoice Header"."Packing Comm.")
            {
            }
            column(InvoiceType; InvoiceType)
            {
            }
            column(ShipmentMethodCode; "Sales Invoice Header"."Shipment Method Code")
            {
            }
            column(ShippingMarksDetails; ShippingMarksDetails)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(SalesInvoiceHeaderorderNoSeries; "Sales Invoice Header"."Order No. Series")
                    {
                    }
                    column(HomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(EMail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyInfo3Picture1; CompanyInfo3.Picture)
                    {
                    }
                    column(SalesInvoiceLinePackingComm; "Sales Invoice Line"."Packing Comm.")
                    {
                    }
                    column(SalesInvoiceLineShippingMarks; "Sales Invoice Line"."Shipping Marks")
                    {
                    }
                    column(SalesInvoiceLineDescription; "Sales Invoice Line"."Description 2")
                    {
                    }
                    column(SalesInvoiceLineNoofPackages; "Sales Invoice Line"."No.of Packages")
                    {
                    }
                    column(SalesInvoiceHeaderLCNo; "Sales Invoice Header"."LC No")
                    {
                    }
                    column(SalesInvoiceHeaderLCDate; "Sales Invoice Header"."LC Date")
                    {
                    }
                    column(SalesInvoiceHeaderLCBank; "Sales Invoice Header"."LC Bank")
                    {
                    }
                    column(SalesInvoiceHeaderPaymentTermsCode; "Sales Invoice Header"."Payment Terms Code")
                    {
                    }
                    column(SalesInvoiceHeaderShipmentMethodCode; "Sales Invoice Header"."Shipment Method Code")
                    {
                    }
                    column(SalesInvoiceHeaderShippingAgentCode; "Sales Invoice Header"."Shipping Agent Code")
                    {
                    }
                    column(SalesInvoiceHeaderCustomerOrderNumber; "Sales Invoice Header"."Customer Order Number.")
                    {
                    }
                    column(CompanyInfoSalesInvoiceConfirmation; CompanyInfo."Sales Invoice / Confirmation")
                    {
                    }
                    column(SalesInvoiceHeaderCustomerOrderDate; "Sales Invoice Header"."Customer Order Date")
                    {
                    }
                    column(SalesInvoiceHeaderShippingMarks; "Sales Invoice Header"."Shipping Marks")
                    {
                    }
                    column(SalesInvoiceHeaderExternalDocumentNo; "Sales Invoice Header"."External Document No.")
                    {
                    }
                    column(DocumentCaptionCopyText; STRSUBSTNO(DocumentCaption, CopyText))
                    {
                    }
                    column(CurrReportPageNo; STRSUBSTNO(Text005, FORMAT(CurrReport.PAGENO)))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(SalesInvoiceHeaderBankCode; "Sales Invoice Header"."Bank Code")
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfoPostCode; CompanyInfo."Post Code")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(CompanyInfoSWIFTCode; CompanyInfo."SWIFT Code")
                    {
                    }
                    column(CompanyInfoSVATRegistrationNo; CompanyInfo."SVAT Registration No.")
                    {
                    }
                    column(SalesInvoiceHeaderTaxAreaCode; "Sales Invoice Header"."Tax Area Code")
                    {
                    }
                    column(BilltoCustNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Customer No.")
                    {
                    }
                    column(PostingDate_SalesInvHdr; FORMAT("Sales Invoice Header"."Posting Date"))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesInvHdr; "Sales Invoice Header"."VAT Registration No.")
                    {
                    }
                    column(DueDate_SalesInvHdr; FORMAT("Sales Invoice Header"."Due Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourReference_SalesInvHdr; "Sales Invoice Header"."Your Reference")
                    {
                    }
                    column(OrderNoText; OrderNoText)
                    {
                    }
                    column(HdrOrderNo_SalesInvHdr; "Sales Invoice Header"."Order No.")
                    {
                    }
                    column(SalesInvoiceHeaderVessel; "Sales Invoice Header".Vessel)
                    {
                    }
                    column(SalesInvoiceHeaderFlightNo; "Sales Invoice Header"."Flight No")
                    {
                    }
                    column(SalesInvoiceHeaderDestination; "Sales Invoice Header".Destination)
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(DocDate_SalesInvHdr; FORMAT("Sales Invoice Header"."Document Date", 0, 4))
                    {
                    }
                    column(PricesInclVAT_SalesInvHdr; "Sales Invoice Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo_SalesInvHdr; FORMAT("Sales Invoice Header"."Prices Including VAT"))
                    {
                    }
                    column(PageCaption; STRSUBSTNO(Text005, ''))
                    {
                    }
                    column(PaymentTermsDesc; PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoVATRegNoCptn; CompanyInfoVATRegNoCptnLbl)
                    {
                    }
                    column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                    {
                    }
                    column(CompanyInfoBankNameCptn; CompanyInfoBankNameCptnLbl)
                    {
                    }
                    column(CompanyInfoBankAccNoCptn; CompanyInfoBankAccNoCptnLbl)
                    {
                    }
                    column(SalesInvDueDateCaption; SalesInvDueDateCaptionLbl)
                    {
                    }
                    column(InvNoCaption; InvNoCaptionLbl)
                    {
                    }
                    column(SalesInvPostingDateCptn; SalesInvPostingDateCptnLbl)
                    {
                    }
                    column(BilltoCustNo_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Bill-to Customer No."))
                    {
                    }
                    column(PricesInclVAT_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    column(SalesInvoiceHeaderCurrencyCode; "Sales Invoice Header"."Currency Code")
                    {
                    }
                    column(CurrencyCode; CurrencyCode)
                    {
                    }
                    dataitem(DimensionLoop1; Integer)
                    {
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1Number; Number)
                        {
                        }
                        column(HeaderDimCaption; HeaderDimCaptionLbl)
                        {
                        }

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
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
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
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(LineAmt_SalesInvLine; "Line Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesInvLine; Description_)
                        {
                        }
                        column(No_SalesInvLine; "No.")
                        {
                        }
                        column(Qty_SalesInvLine; Quantity)
                        {
                        }
                        column(UOM_SalesInvLine; "Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesInvLine; "Unit Price")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(Discount_SalesInvLine; "Line Discount %")
                        {
                        }
                        column(VATIdentifier_SalesInvLine; "VAT Identifier")
                        {
                        }
                        column(HSCode_SalesInvLine; "H.S.Code")
                        {
                        }
                        column(ShippingMarks_SalesInvLine; "Shipping Marks")
                        {
                        }
                        column(PostedShipmentDate; FORMAT(PostedShipmentDate))
                        {
                        }
                        column(Type_SalesInvLine; Type_)
                        {
                        }
                        column(InvDiscLineAmt_SalesInvLine; -"Inv. Discount Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvDiscAmount; TotalInvDiscAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(Amount_SalesInvLine; Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Amount_AmtInclVAT; "Amount Including VAT" - Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtInclVAT_SalesInvLine; "Amount Including VAT")
                        {
                            AutoFormatExpression = GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountVAT; TotalAmountVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmtAfterInvDiscAmt; -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT"))
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseDisc_SalesInvHdr; "Sales Invoice Header"."VAT Base Discount %")
                        {
                            AutoFormatType = 1;
                        }
                        column(TotalPaymentDiscOnVAT; TotalPaymentDiscOnVAT)
                        {
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText_SalesInvLine; TotalInclVATText)
                        {
                        }
                        column(VATAmtText_SalesInvLine; VATAmountLine.VATAmountText)
                        {
                        }
                        column(DocNo_SalesInvLine; "Document No.")
                        {
                        }
                        column(LineNo_SalesInvLine; "Line No.")
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(SalesInvLineDiscCaption; SalesInvLineDiscCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(PostedShipmentDateCaption; PostedShipmentDateCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(LineAmtAfterInvDiscCptn; LineAmtAfterInvDiscCptnLbl)
                        {
                        }
                        column(Desc_SalesInvLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(No_SalesInvLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        column(Qty_SalesInvLineCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        column(UOM_SalesInvLineCaption; FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(VATIdentifier_SalesInvLineCaption; FIELDCAPTION("VAT Identifier"))
                        {
                        }
                        column(TotNBTAmt; TotNBTAmt)
                        {
                        }
                        column(TotVATAmt; TotVATAmt)
                        {
                        }
                        column(TotSVATAmt; TotSVATAmt)
                        {
                        }
                        column(TotalAmount; TotalAmount)
                        {
                        }
                        column(txtExtendedLine; txtExtendedLine)
                        {
                        }
                        column(SILinePackingComm; LineComment_)
                        {
                        }
                        dataitem("Sales Shipment Buffer"; Integer)
                        {
                            DataItemTableView = SORTING(Number);
                            column(SalesShptBufferPostDate; FORMAT(SalesShipmentBuffer."Posting Date"))
                            {
                            }
                            column(SalesShptBufferQty; SalesShipmentBuffer.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(ShipmentCaption; ShipmentCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                IF Number = 1 THEN
                                    SalesShipmentBuffer.FIND('-')
                                ELSE
                                    SalesShipmentBuffer.NEXT;
                            end;

                            trigger OnPreDataItem();
                            begin
                                SalesShipmentBuffer.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                                SalesShipmentBuffer.SETRANGE("Line No.", "Sales Invoice Line"."Line No.");

                                SETRANGE(Number, 1, SalesShipmentBuffer.COUNT);
                            end;
                        }
                        dataitem(DimensionLoop2; Integer)
                        {
                            DataItemTableView = SORTING(Number)
                                                WHERE(Number = FILTER(1 ..));
                            column(DimText_DimLoop; DimText)
                            {
                            }
                            column(LineDimCaption; LineDimCaptionLbl)
                            {
                            }

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

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Sales Invoice Line"."Dimension Set ID");
                            end;
                        }
                        dataitem(AsmLoop; Integer)
                        {
                            DataItemTableView = SORTING(Number);
                            column(TempPostedAsmLineNo; BlanksForIndent + TempPostedAsmLine."No.")
                            {
                            }
                            column(TempPostedAsmLineQuantity; TempPostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(TempPostedAsmLineDesc; BlanksForIndent + TempPostedAsmLine.Description)
                            {
                            }
                            column(TempPostAsmLineVartCode; BlanksForIndent + TempPostedAsmLine."Variant Code")
                            { }
                            column(TempPostedAsmLineUOM; GetUOMText(TempPostedAsmLine."Unit of Measure Code"))
                            { }

                            trigger OnAfterGetRecord();
                            begin
                                IF Number = 1 THEN
                                    TempPostedAsmLine.FINDSET
                                ELSE
                                    TempPostedAsmLine.NEXT;
                            end;

                            trigger OnPreDataItem();
                            begin
                                CLEAR(TempPostedAsmLine);
                                IF NOT DisplayAssemblyInformation THEN
                                    CurrReport.BREAK;
                                CollectAsmInformation;
                                CLEAR(TempPostedAsmLine);
                                SETRANGE(Number, 1, TempPostedAsmLine.COUNT);
                            end;
                        }

                        trigger OnAfterGetRecord();
                        begin
                            icount := 0;
                            icount1 := 0;
                            LineLevelTotal := 0.0;
                            TotNBTAmt := 0.0;
                            TotSVATAmt := 0.0;
                            TotVATAmt := 0.0;
                            TotalSubTotal := 0.0;
                            TotalAmount := 0.0;

                            PostedShipmentDate := 0D;
                            IF Quantity <> 0 THEN
                                PostedShipmentDate := FindPostedShipmentDate;

                            IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "No." := '';

                            VATAmountLine.INIT;
                            VATAmountLine."VAT Identifier" := "VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                            VATAmountLine."Line Amount" := "Line Amount";
                            IF "Allow Invoice Disc." THEN
                                VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                            VATAmountLine.InsertLine;

                            //TotalSubTotal += "Line Amount";
                            TotalInvDiscAmount -= "Inv. Discount Amount";
                            //TotalAmount += Amount;
                            TotalAmountVAT += "Amount Including VAT" - Amount;
                            TotalAmountInclVAT += "Amount Including VAT";
                            TotalPaymentDiscOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");

                            TotalSubTotal += "Line Amount";
                            TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                            LineLevelTotal += "Line Amount" - "Inv. Discount Amount";

                            recTaxDetail.RESET;
                            recTaxDetail.SETRANGE(recTaxDetail."Tax Group Code", "Tax Group Code");
                            //MESSAGE('recTaxDetail.COUNT = '+FORMAT(recTaxDetail.COUNT));
                            IF recTaxDetail.FIND('-') THEN BEGIN
                                REPEAT
                                    taxBelowAmt := recTaxDetail."Tax Below Maximum";
                                    taxJurisdictionCode := recTaxDetail."Tax Jurisdiction Code";
                                    IF recTaxDetail."Tax Jurisdiction Code" = 'NBT' THEN BEGIN
                                        LineLevelTotal += ("Line Amount" - "Inv. Discount Amount") * taxBelowAmt / 100;
                                        TotNBTAmt += ("Line Amount" - "Inv. Discount Amount") * taxBelowAmt / 100;
                                        //MESSAGE('Inside NBT Loop '+FORMAT(TotNBTAmt));
                                    END;

                                    IF recTaxDetail."Tax Jurisdiction Code" = 'SVAT' THEN BEGIN
                                        //LineLevelTotal+= (SalesLine."Line Amount"-SalesLine."Inv. Discount Amount")*taxBelowAmt/100;
                                        TotSVATAmt += ("Line Amount" - "Inv. Discount Amount" + TotNBTAmt) * taxBelowAmt / 100;
                                        //TotSVATAmt+=("Line Amount"-"Inv. Discount Amount")*taxBelowAmt/100;
                                        //MESSAGE('Inside SVAT Loop');
                                    END;

                                    IF recTaxDetail."Tax Jurisdiction Code" = 'VAT' THEN BEGIN
                                        LineLevelTotal += ("Line Amount" - "Inv. Discount Amount" + TotNBTAmt) * taxBelowAmt / 100;
                                        TotVATAmt += ("Line Amount" - "Inv. Discount Amount" + TotNBTAmt) * taxBelowAmt / 100;
                                        //message(recTaxDetail."Tax Jurisdiction Code"+'- '+recTaxDetail."Tax Group Code");
                                    END;
                                    icount += 1;
                                    recTaxDetail.NEXT;
                                UNTIL recTaxDetail.COUNT <= icount;
                            END;

                            //TotalAmount += LineLevelTotal;

                            IF CheckLKR THEN BEGIN
                                //TotalAmount +=LineLevelTotal/"Sales Invoice Header"."Currency Factor";
                                //USDAmount:=(LineLevelTotal/"Sales Invoice Header"."Currency Factor")*CurrExchRate.ExchangeRate("Sales Invoice Header"."Posting Date",'USD');
                            END
                            ELSE
                                TotalAmount += LineLevelTotal;
                            //-------------------------
                            recExtendedTextLine.RESET;
                            recExtendedTextLine.SETRANGE(recExtendedTextLine."No.", "No.");
                            REPEAT
                                //IF recExtendedTextLine.FINDFIRST THEN BEGIN
                                txtExtendedLine := recExtendedTextLine.Text;
                                //MESSAGE(txtExtendedLine);
                                icount1 += 1;
                                recExtendedTextLine.NEXT;
                            UNTIL recExtendedTextLine.COUNT <= icount1;
                            //MESSAGE('recExtendedTextLine.Text = '+txtExtendedLine);
                            //END;


                            //Sriyantha  06_02_2014
                            IF (InvoiceType = InvoiceType::"Packing List") AND ("Sales Invoice Line".Type = "Sales Invoice Line".Type::"Charge (Item)") THEN BEGIN
                                Type_ := ' ';
                                Description_ := '';
                            END ELSE BEGIN
                                Type_ := FORMAT(Type);
                                Description_ := Description;
                            END;
                            //Sriyantha  06_02_2014

                            //001--Vidura-JIT--------------------
                            TotGrossWeight += "Gross Weight";
                            TotNetWeight += "Net Weight";
                            IF "Sales Invoice Line"."Shipping Marks" <> '' THEN
                                ShippingMarksDetails += "Sales Invoice Line"."Shipping Marks" + '/';
                            //----------------------------------

                            //Sriyantha  06_19_2014
                            //LineComment_ +=  "Sales Invoice Line"."Packing Comm."
                            //dsa
                            SalesLineComment.RESET;
                            SalesLineComment.SETRANGE(SalesLineComment."No.", "No.");
                            IF SalesLineComment.FINDFIRST THEN
                                REPEAT
                                    IF SalesLineComment.Comment <> '' THEN
                                        txtSalesComment += SalesLineComment.Comment + ' ';
                                UNTIL (SalesLineComment.NEXT = 0);
                        end;

                        trigger OnPreDataItem();
                        begin

                            VATAmountLine.DELETEALL;
                            SalesShipmentBuffer.RESET;
                            SalesShipmentBuffer.DELETEALL;
                            FirstValueEntryNo := 0;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                            CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount");
                        end;
                    }
                    dataitem(VATCounter; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmtLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmt; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmt; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TaxGroupCode; "Sales Invoice Line"."Tax Group Code")
                        {
                        }
                        column(VATAmtLineInvDiscAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPer; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmtSpecificationCptn; VATAmtSpecificationCptnLbl)
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(LineAmtCaption; LineAmtCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VatCounterLCY; Integer)
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATPer_VATCounterLCY; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIdentifier_VATCounterLCY; VATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := ROUND(VATAmountLine."VAT Base" / "Sales Invoice Header"."Currency Factor");
                            VALVATAmountLCY := ROUND(VATAmountLine."VAT Amount" / "Sales Invoice Header"."Currency Factor");
                        end;

                        trigger OnPreDataItem();
                        begin
                            IF (NOT GLSetup."Print VAT specification in LCY") OR
                               ("Sales Invoice Header"."Currency Code" = '')
                            THEN
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(VALVATBaseLCY, VALVATAmountLCY);

                            IF GLSetup."LCY Code" = '' THEN
                                VALSpecLCYHeader := Text007 + Text008
                            ELSE
                                VALSpecLCYHeader := Text007 + FORMAT(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code", 1);
                            CalculatedExchRate := ROUND(1 / "Sales Invoice Header"."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                            VALExchRate := STRSUBSTNO(Text009, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesInvHdr; "Sales Invoice Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShiptoAddrCaption; ShiptoAddrCaptionLbl)
                        {
                        }
                        column(SelltoCustNo_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Sell-to Customer No."))
                        {
                        }

                        trigger OnPreDataItem();
                        begin
                            IF NOT ShowShippingAddr THEN
                                CurrReport.BREAK;
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := Text003;
                        OutputNo += 1;
                    END;
                    CurrReport.PAGENO := 1;

                    TotalSubTotal := 0;
                    TotalInvDiscAmount := 0;
                    TotalAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscOnVAT := 0;
                end;

                trigger OnPostDataItem();
                begin
                    IF NOT CurrReport.PREVIEW THEN
                        SalesInvCountPrinted.RUN("Sales Invoice Header");
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + Cust."Invoice Copies" + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                //Vidura-JIT-------------------------------
                IF (CheckLKR) AND ("Currency Code" <> 'USD') AND ("Currency Code" <> '') THEN
                    CheckCurrUSD := TRUE;
                //---------------------------------------
                //CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");     //MR

                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");
                //------shan005
                Rec480.SETRANGE(Rec480."Dimension Set ID", "Dimension Set ID");
                Rec480.SETFILTER(Rec480."Dimension Code", 'SEGMENT');
                IF Rec480.FINDFIRST THEN BEGIN
                    Rec349.SETRANGE(Rec349.Code, Rec480."Dimension Value Code");
                    IF Rec349.FINDFIRST THEN;

                END;
                //-----shan005

                IF "Order No." = '' THEN
                    OrderNoText := ''
                ELSE
                    OrderNoText := FIELDCAPTION("Order No.");
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
                FormatAddr.SalesInvBillTo(CustAddr, "Sales Invoice Header");
                IF NOT Cust.GET("Bill-to Customer No.") THEN
                    CLEAR(Cust);

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
                FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, "Sales Invoice Header");
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                    IF ShipToAddr[i] <> CustAddr[i] THEN
                        ShowShippingAddr := TRUE;

                IF LogInteraction THEN
                    IF NOT CurrReport.PREVIEW THEN BEGIN
                        IF "Bill-to Contact No." <> '' THEN
                            SegManagement.LogDocument(
                              4, "No.", 0, 0, DATABASE::Contact, "Bill-to Contact No.", "Salesperson Code",
                              "Campaign No.", "Posting Description", '')
                        ELSE
                            SegManagement.LogDocument(
                              4, "No.", 0, 0, DATABASE::Customer, "Bill-to Customer No.", "Salesperson Code",
                              "Campaign No.", "Posting Description", '');
                    END;
                //==== SW-BankDetails=====
                recBank.RESET;
                recBank.SETRANGE(recBank."No.", "Sales Invoice Header"."Bank Code");

                IF recBank.FINDFIRST THEN BEGIN
                    recBankBankAccountNo := recBank."Bank Account No.";
                    recBankName := recBank.Name;
                    recBankAddress := recBank.Address;
                    recBankAddress2 := recBank."Address 2";
                    recBankPostCode := recBank."Post Code"

                END;
                //===================//
                //dddd
                SalesLineComment.RESET;
                SalesLineComment.SETRANGE(SalesLineComment."No.", "No.");
                IF SalesLineComment.FINDFIRST THEN
                    REPEAT
                        IF SalesLineComment.Comment <> '' THEN
                            txtSalesComment += SalesLineComment.Comment + ' ';

                    UNTIL (SalesLineComment.NEXT = 0);

                //MESSAGE('recPurchaseCommentLine.Comment = '+txtPurchaseComment);
                //END;

                //==== SW-PaymentTermDiscrption=====
                recPaymentterm.RESET;
                recPaymentterm.SETRANGE(recPaymentterm.Code, "Sales Invoice Header"."Payment Terms Code");

                IF recPaymentterm.FINDFIRST THEN BEGIN
                    recPaymentterm.Code := recPaymentterm.Code;

                END;
                //===================//

                //==== SW-shipping Agent name=====
                recshipagentcode.RESET;
                recshipagentcode.SETRANGE(recshipagentcode.Code, "Sales Invoice Header"."Shipping Agent Code");

                IF recshipagentcode.FINDFIRST THEN BEGIN
                    recshipagentcode.Code := recshipagentcode.Code;

                END;
                //===================//

                Customer_A.SETRANGE("No.", "Bill-to Customer No.");
                IF NOT Customer_A.FINDFIRST THEN
                    CLEAR(Customer_A);

                //==== SW-Dimension Value=====

                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, "Shortcut Dimension 1 Code");
                IF DimensionValue.FIND('-') THEN;

                //===================//

                //Sriyantha05.13.2014
                Customer_.RESET;
                Customer_.SETFILTER("No.", "Bill-to Customer No.");
                IF Customer_.FINDFIRST THEN BEGIN
                    Country_.RESET;
                    Country_.SETFILTER(Code, Customer_."Country/Region Code");
                    Country_.FINDFIRST
                END;

                //-Vidura-JIT--------------------------
                FOBValue := GetFOBValue;
                IF NOT CheckLKR THEN
                    CurrencyCode := "Sales Invoice Header"."Currency Code"
                ELSE BEGIN
                    IF "Currency Factor" <> 0 THEN
                        FOBLKR := FOBValue / "Sales Invoice Header"."Currency Factor"
                    ELSE
                        FOBLKR := FOBValue;
                    USDAmount := FOBLKR * CurrExchRate.ExchangeRate("Sales Invoice Header"."Posting Date", 'USD');
                END;
                //--------------------------------------


                //Sriyantha 06.11.2014
                SlsCmtLine_.RESET;
                SlsCmtLine_.SETFILTER("No.", "No.");
                IF SlsCmtLine_.FINDFIRST THEN
                    REPEAT
                        IF (SlsCmtLine_."Document Line No." > 0) THEN
                            LineComment_ += SlsCmtLine_.Comment;

                    UNTIL SlsCmtLine_.NEXT = 0;
                //Sriyantha 06.11.2014


                //--------------------------
                IF "Currency Code" = '' THEN
                    InvoiceHeader := 'TAX INVOICE';
                //ELSE
                //InvoiceHeader:='Commercial Invoice';
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
                        Caption = 'No. of Copies';
                        ApplicationArea = All;
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                        ApplicationArea = All;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ApplicationArea = All;
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        Caption = 'Show Assembly Components';
                        ApplicationArea = All;
                    }
                    field(InvoiceType; InvoiceType)
                    {
                        Caption = 'Invoice Type';
                        ApplicationArea = All;
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
            InitLogInteraction;
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
        CompanyInfo.CALCFIELDS(Picture);
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

    trigger OnPreReport();
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
        //Vidura-JIT--------------------
        CheckCurrUSD := FALSE;
        CheckWeightPrint := FALSE;
        CheckLKR := FALSE;
        CheckPackingList := FALSE;
        CASE InvoiceType OF
            InvoiceType::"Packing List":
                BEGIN
                    InvoiceHeader := 'Packing List';
                    CheckWeightPrint := TRUE;
                    CheckPackingList := TRUE;
                END;
            InvoiceType::"Department of Commerce":
                BEGIN
                    InvoiceHeader := 'Invoice';
                    CheckWeightPrint := TRUE;
                    CheckLKR := TRUE;
                    CurrencyCode := 'LKR';
                END;
            InvoiceType::"Commercial Invoice":
                BEGIN
                    InvoiceHeader := 'Commercial Invoice';
                    //CheckPackingList:=TRUE;//Sriyantha 06.11.2014
                END;
        END;
        //-----------------------------------------
    end;

    var
        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Sales - Invoice %1';
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
        Cust: Record "Customer";
        VATAmountLine: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        Language: Record "Language";
        CurrExchRate: Record "Currency Exchange Rate";
        TempPostedAsmLine: Record "Posted Assembly Line" temporary;
        SalesInvCountPrinted: Codeunit "Sales Inv.-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit "SegManagement";
        SalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
        PostedShipmentDate: Date;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        OrderNoText: Text[80];
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
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text007: Label '"VAT Amount Specification in "';
        Text008: Label 'Local Currency';
        VALExchRate: Text[50];
        Text009: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        Text010: Label 'Sales - Prepayment Invoice %1';
        OutputNo: Integer;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPaymentDiscOnVAT: Decimal;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoVATRegNoCptnLbl: Label 'VAT Reg. No.';
        CompanyInfoGiroNoCaptionLbl: Label 'Giro No.';
        CompanyInfoBankNameCptnLbl: Label 'Bank';
        CompanyInfoBankAccNoCptnLbl: Label 'Account No.';
        SalesInvDueDateCaptionLbl: Label 'Due Date';
        InvNoCaptionLbl: Label 'Invoice No.';
        SalesInvPostingDateCptnLbl: Label 'Posting Date';
        HeaderDimCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        SalesInvLineDiscCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        PostedShipmentDateCaptionLbl: Label 'Posted Shipment Date';
        SubtotalCaptionLbl: Label 'Subtotal';
        LineAmtAfterInvDiscCptnLbl: Label 'Payment Discount on VAT';
        ShipmentCaptionLbl: Label 'Shipment';
        LineDimCaptionLbl: Label 'Line Dimensions';
        VATAmtSpecificationCptnLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmtCaptionLbl: Label 'Line Amount';
        ShiptoAddrCaptionLbl: Label 'Ship-to Address';
        InvDiscountAmtCaptionLbl: Label 'Invoice Discount Amount';
        DocumentDateCaptionLbl: Label 'Document Date';
        PaymentTermsDescCaptionLbl: Label 'Payment Terms';
        ShptMethodDescCaptionLbl: Label 'Shipment Method';
        VATPercentageCaptionLbl: Label 'VAT %';
        TotalCaptionLbl: Label 'Total';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmtCaptionLbl: Label 'VAT Amount';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        HomePageCaptionLbl: Label 'Home Page';
        EMailCaptionLbl: Label 'E-Mail';
        recBank: Record "Bank Account";
        recBankBankAccountNo: Text[30];
        recBankName: Text[50];
        recBankAddress: Text[50];
        recBankAddress2: Text[50];
        recBankPostCode: Text[50];
        SalesLineComment: Record "Sales Comment Line";
        TotNBTAmt: Decimal;
        TotVATAmt: Decimal;
        TotSVATAmt: Decimal;
        TotalAmount: Decimal;
        TotalSubTotal: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        recExtendedTextLine: Record "Extended Text Line";
        txtExtendedLine: Text[800];
        txtSalesComment: Text[800];
        recTaxDetail: Record "Tax Detail";
        recTaxAreaLine: Record "Tax Area Line";
        taxBelowAmt: Decimal;
        LineLevelTotal: Decimal;
        icount: Integer;
        taxJurisdictionCode: Text[30];
        icount1: Integer;
        recPaymentterm: Record "Payment Terms";
        recpaytermdis: Text[30];
        recshipagentcode: Record "Shipping Agent";
        recshipagentdiscription: Integer;
        DimensionValue: Record "Dimension Value";
        icount2: Integer;
        Customer_: Record "Customer";
        Country_: Record "Country/Region";
        InvoiceType: Option "Commercial Invoice","Packing List","Department of Commerce";
        TotGrossWeight: Decimal;
        TotNetWeight: Decimal;
        InvoiceHeader: Text[100];
        CheckLKR: Boolean;
        CheckWeightPrint: Boolean;
        CurrencyCode: Code[10];
        CheckPackingList: Boolean;
        FOBValue: Decimal;
        USDAmount: Decimal;
        Type_: Text;
        Description_: Text;
        FOBLKR: Decimal;
        CheckCurrUSD: Boolean;
        SlsCmtLine_: Record "Sales Comment Line";
        LineComment_: Text;
        ShippingMarksDetails: Text[1000];
        Rec480: Record "Dimension Set Entry";
        Rec349: Record "Dimension Value";
        Customer_A: Record "Customer";

    procedure InitLogInteraction();
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;

    procedure FindPostedShipmentDate(): Date;
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentBuffer2: Record "Sales Shipment Buffer" temporary;
    begin
        NextEntryNo := 1;
        IF "Sales Invoice Line"."Shipment No." <> '' THEN
            IF SalesShipmentHeader.GET("Sales Invoice Line"."Shipment No.") THEN
                EXIT(SalesShipmentHeader."Posting Date");

        IF "Sales Invoice Header"."Order No." = '' THEN
            EXIT("Sales Invoice Header"."Posting Date");

        CASE "Sales Invoice Line".Type OF
            "Sales Invoice Line".Type::Item:
                GenerateBufferFromValueEntry("Sales Invoice Line");
            "Sales Invoice Line".Type::"G/L Account", "Sales Invoice Line".Type::Resource,
          "Sales Invoice Line".Type::"Charge (Item)", "Sales Invoice Line".Type::"Fixed Asset":
                GenerateBufferFromShipment("Sales Invoice Line");
            "Sales Invoice Line".Type::" ":
                EXIT(0D);
        END;

        SalesShipmentBuffer.RESET;
        SalesShipmentBuffer.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", "Sales Invoice Line"."Line No.");
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer2 := SalesShipmentBuffer;
            IF SalesShipmentBuffer.NEXT = 0 THEN BEGIN
                SalesShipmentBuffer.GET(
                  SalesShipmentBuffer2."Document No.", SalesShipmentBuffer2."Line No.", SalesShipmentBuffer2."Entry No.");
                SalesShipmentBuffer.DELETE;
                EXIT(SalesShipmentBuffer2."Posting Date");
            END;
            SalesShipmentBuffer.CALCSUMS(Quantity);
            IF SalesShipmentBuffer.Quantity <> "Sales Invoice Line".Quantity THEN BEGIN
                SalesShipmentBuffer.DELETEALL;
                EXIT("Sales Invoice Header"."Posting Date");
            END;
        END ELSE
            EXIT("Sales Invoice Header"."Posting Date");
    end;

    procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record "Sales Invoice Line");
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", SalesInvoiceLine2."Document No.");
        ValueEntry.SETRANGE("Posting Date", "Sales Invoice Header"."Posting Date");
        ValueEntry.SETRANGE("Item Charge No.", '');
        ValueEntry.SETFILTER("Entry No.", '%1..', FirstValueEntryNo);
        IF ValueEntry.FIND('-') THEN
            REPEAT
                IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                    IF SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 THEN
                        Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
                    ELSE
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      SalesInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                END;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            UNTIL (ValueEntry.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure GenerateBufferFromShipment(SalesInvoiceLine: Record "Sales Invoice Line");
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine2: Record "Sales Invoice Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesInvoiceHeader.SETCURRENTKEY("Order No.");
        SalesInvoiceHeader.SETFILTER("No.", '..%1', "Sales Invoice Header"."No.");
        SalesInvoiceHeader.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
        IF SalesInvoiceHeader.FIND('-') THEN
            REPEAT
                SalesInvoiceLine2.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine2.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
                SalesInvoiceLine2.SETRANGE(Type, SalesInvoiceLine.Type);
                SalesInvoiceLine2.SETRANGE("No.", SalesInvoiceLine."No.");
                SalesInvoiceLine2.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                IF SalesInvoiceLine2.FIND('-') THEN
                    REPEAT
                        TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
                    UNTIL SalesInvoiceLine2.NEXT = 0;
            UNTIL SalesInvoiceHeader.NEXT = 0;

        SalesShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
        SalesShipmentLine.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
        SalesShipmentLine.SETRANGE("Order Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE(Type, SalesInvoiceLine.Type);
        SalesShipmentLine.SETRANGE("No.", SalesInvoiceLine."No.");
        SalesShipmentLine.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
        SalesShipmentLine.SETFILTER(Quantity, '<>%1', 0);

        IF SalesShipmentLine.FIND('-') THEN
            REPEAT
                IF "Sales Invoice Header"."Get Shipment Used" THEN
                    CorrectShipment(SalesShipmentLine);
                IF ABS(SalesShipmentLine.Quantity) <= ABS(TotalQuantity - SalesInvoiceLine.Quantity) THEN
                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
                ELSE BEGIN
                    IF ABS(SalesShipmentLine.Quantity) > ABS(TotalQuantity) THEN
                        SalesShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
                    SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

                    IF SalesShipmentHeader.GET(SalesShipmentLine."Document No.") THEN
                        AddBufferEntry(
                          SalesInvoiceLine,
                          Quantity,
                          SalesShipmentHeader."Posting Date");
                END;
            UNTIL (SalesShipmentLine.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure CorrectShipment(var SalesShipmentLine: Record "Sales Shipment Line");
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.SETCURRENTKEY("Shipment No.", "Shipment Line No.");
        SalesInvoiceLine.SETRANGE("Shipment No.", SalesShipmentLine."Document No.");
        SalesInvoiceLine.SETRANGE("Shipment Line No.", SalesShipmentLine."Line No.");
        IF SalesInvoiceLine.FIND('-') THEN
            REPEAT
                SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
            UNTIL SalesInvoiceLine.NEXT = 0;
    end;

    procedure AddBufferEntry(SalesInvoiceLine: Record "Sales Invoice Line"; QtyOnShipment: Decimal; PostingDate: Date);
    begin
        SalesShipmentBuffer.SETRANGE("Document No.", SalesInvoiceLine."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentBuffer.SETRANGE("Posting Date", PostingDate);
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
            SalesShipmentBuffer.MODIFY;
            EXIT;
        END;

        WITH SalesShipmentBuffer DO BEGIN
            "Document No." := SalesInvoiceLine."Document No.";
            "Line No." := SalesInvoiceLine."Line No.";
            "Entry No." := NextEntryNo;
            Type := SalesInvoiceLine.Type;
            "No." := SalesInvoiceLine."No.";
            Quantity := QtyOnShipment;
            "Posting Date" := PostingDate;
            INSERT;
            NextEntryNo := NextEntryNo + 1
        END;
    end;

    local procedure DocumentCaption(): Text[250];
    begin
        IF "Sales Invoice Header"."Prepayment Invoice" THEN
            EXIT(Text010);
        EXIT(Text004);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; DisplayAsmInfo: Boolean);
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    procedure CollectAsmInformation();
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        SalesShipmentLine: Record "Sales Shipment Line";
    begin
        TempPostedAsmLine.DELETEALL;
        IF "Sales Invoice Line".Type <> "Sales Invoice Line".Type::Item THEN
            EXIT;
        WITH ValueEntry DO BEGIN
            SETCURRENTKEY("Document No.");
            SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
            SETRANGE("Document Type", "Document Type"::"Sales Invoice");
            SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
            IF NOT FINDSET THEN
                EXIT;
        END;
        REPEAT
            IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN
                IF ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Shipment" THEN BEGIN
                    SalesShipmentLine.GET(ItemLedgerEntry."Document No.", ItemLedgerEntry."Document Line No.");
                    IF SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader) THEN BEGIN
                        PostedAsmLine.SETRANGE("Document No.", PostedAsmHeader."No.");
                        IF PostedAsmLine.FINDSET THEN
                            REPEAT
                                TreatAsmLineBuffer(PostedAsmLine);
                            UNTIL PostedAsmLine.NEXT = 0;
                    END;
                END;
        UNTIL ValueEntry.NEXT = 0;
    end;

    procedure TreatAsmLineBuffer(PostedAsmLine: Record "Posted Assembly Line");
    begin
        CLEAR(TempPostedAsmLine);
        TempPostedAsmLine.SETRANGE(Type, PostedAsmLine.Type);
        TempPostedAsmLine.SETRANGE("No.", PostedAsmLine."No.");
        TempPostedAsmLine.SETRANGE("Variant Code", PostedAsmLine."Variant Code");
        TempPostedAsmLine.SETRANGE(Description, PostedAsmLine.Description);
        TempPostedAsmLine.SETRANGE("Unit of Measure Code", PostedAsmLine."Unit of Measure Code");
        IF TempPostedAsmLine.FINDFIRST THEN BEGIN
            TempPostedAsmLine.Quantity += PostedAsmLine.Quantity;
            TempPostedAsmLine.MODIFY;
        END ELSE BEGIN
            CLEAR(TempPostedAsmLine);
            TempPostedAsmLine := PostedAsmLine;
            TempPostedAsmLine.INSERT;
        END;
    end;

    procedure GetUOMText(UOMCode: Code[10]): Text[10];
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        IF NOT UnitOfMeasure.GET(UOMCode) THEN
            EXIT(UOMCode);
        EXIT(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10];
    begin
        EXIT(PADSTR('', 2, ' '));
    end;

    procedure CalculateNetAndGrossWeight(var GrossWeight: Decimal; var NetWeight: Decimal);
    var
        SLine: Record "Sales Line";
    begin
        //001--Vidura-JIT-------------------
        CLEAR(GrossWeight);
        CLEAR(NetWeight);
        SLine.SETCURRENTKEY("Document Type", "Document No.");
        SLine.SETRANGE("Document Type", SLine."Document Type"::Order);
        SLine.SETRANGE("Document No.", "Sales Invoice Header"."Order No.");
        IF SLine.FINDFIRST THEN BEGIN
            REPEAT
                GrossWeight += SLine."Gross Weight";
                NetWeight += SLine."Net Weight";
            UNTIL (SLine.NEXT = 0);
        END;
        //------------------------------------------
    end;

    procedure GetFOBValue() val: Decimal;
    var
        SInvLine: Record "Sales Invoice Line";
        ChrgAmt_: Decimal;
        LineAmt_: Decimal;
    begin
        IF InvoiceType = InvoiceType::"Department of Commerce" THEN BEGIN  //---------Sriyantha 06.03.2014
            SInvLine.SETCURRENTKEY("Document No.");
            SInvLine.SETRANGE("Document No.", "Sales Invoice Header"."No.");
            IF SInvLine.FINDFIRST THEN BEGIN
                REPEAT
                    IF SInvLine.Type = SInvLine.Type::"Charge (Item)" THEN
                        ChrgAmt_ += SInvLine."Line Amount";

                    LineAmt_ += SInvLine."Line Amount";
                UNTIL (SInvLine.NEXT = 0);

                val := LineAmt_ - ChrgAmt_;
            END;
        END ELSE BEGIN //-----------------------------------------------Sriyantha 06.03.2014
            SInvLine.SETCURRENTKEY("Document No.");
            SInvLine.SETRANGE("Document No.", "Sales Invoice Header"."No.");
            IF SInvLine.FINDFIRST THEN BEGIN
                REPEAT
                    IF SInvLine.Type = SInvLine.Type::"Charge (Item)" THEN
                        val -= SInvLine."Line Amount"
                    ELSE
                        val += SInvLine."Line Amount";

                UNTIL (SInvLine.NEXT = 0);
            END;
        END;
    end;
}


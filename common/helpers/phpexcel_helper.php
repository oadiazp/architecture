<?php
    function create_sheet (&$phpExcel, &$activeSheet) {
        $phpExcel = new PHPExcel ();
        $phpExcel->setActiveSheetIndex(0);

        $activeSheet = $phpExcel->getActiveSheet();
    }

    function save ($phpExcel, $pFilename) {
        $io = PHPExcel_IOFactory::createWriter($phpExcel, 'Excel2007');
        $io->save($pFilename);
    }

    function create_header ($pActiveSheet, $pTitle) {
        $activeSheet = $pActiveSheet; $currRow = 0;

        if (is_string($pTitle))
            $pTitle = array ($pTitle);

        //APPP
        $objRichText = new PHPExcel_RichText($activeSheet->getCell('B4'));
        $tmp = $objRichText->createTextRun('Asamblea Provincial del Poder Popular');
        $tmp->getFont ()->setBold (true);
        $tmp->getFont ()->setSize (14);
        $tmp->getFont ()->setItalic (true);
        
        //Gtmo
        $objRichText = new PHPExcel_RichText($activeSheet->getCell('B5'));
        $tmp = $objRichText->createTextRun('Guantánamo');
        $tmp->getFont ()->setBold (true);
        $tmp->getFont ()->setSize (14);
        $tmp->getFont ()->setItalic (true);
        
        //Escudo
        $objDrawing = new PHPExcel_Worksheet_Drawing();
        $objDrawing->setName('Logo');
        $objDrawing->setDescription('Logo');
        $objDrawing->setPath('img/Escudo.jpg');
        $objDrawing->setCoordinates('B2');
        $objDrawing->setHeight(36);
        $objDrawing->setWorksheet($activeSheet);

        //Titulo
        for ($i = 0; $i < count ($pTitle); $i++) {
            $currRow = $i + 7;
            $objRichText = new PHPExcel_RichText($activeSheet->getCell("B$currRow"));
            $tmp = $objRichText->createTextRun($pTitle [$i]);
            $tmp->getFont ()->setBold (true);
            $tmp->getFont ()->setSize (14);
        }

        return $currRow;
    }

     function create_parameters ($pActiveSheet, $pRow, $pParam) {
        $activeSheet = $pActiveSheet;
        $currRow = $pRow;

        if (is_string($pParam))
            $pParam = array ($pParam);

        for ($i = 0; $i < count ($pParam); $i++) {
            $currRow = $i + $pRow;

            $objRichText = new PHPExcel_RichText($activeSheet->getCell("B$currRow"));
            $tmp = $objRichText->createTextRun("{$pParam [$i]->name}:");
            $tmp->getFont ()->setUnderline(PHPExcel_Style_Font::UNDERLINE_SINGLE);
            $tmp->getFont ()->setSize (12);
            $activeSheet->getStyle("B$currRow")->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);

            $objRichText = new PHPExcel_RichText($activeSheet->getCell("C$currRow"));
            $tmp = $objRichText->createTextRun($pParam [$i]->value);
            $tmp->getFont ()->setSize (12);
            $activeSheet->getStyle("C$currRow")->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        }

        return $currRow;
    }

    function create_borders ($pActiveSheet, $pInitialRow, $pFinalRow, $pInitialColumn, $pFinalColumn) {
        $activeSheet = $pActiveSheet;

        $borders = array(
			'borders' => array(
				'right'     => array(
 					'style' => PHPExcel_Style_Border::BORDER_THIN
 				),
                'left'     => array(
 					'style' => PHPExcel_Style_Border::BORDER_THIN
 				),
                'top'     => array(
 					'style' => PHPExcel_Style_Border::BORDER_THIN
 				),
                'bottom'     => array(
 					'style' => PHPExcel_Style_Border::BORDER_THIN
 				)
			)
		);

    for ($i = $pInitialRow; $i < $pFinalRow; $i++)
        for ($j = $pInitialColumn; $j < $pFinalColumn; $j++)
            $activeSheet->getStyleByColumnAndRow ($i, $j)->applyFromArray ($borders);
    }

    function create_columns ($pActiveSheet, $pRow, $pColumns) {
        for ($i = 0; $i < count ($pColumns); $i++) {
            $currRow = $i + $pRow;

            $objRichText = new PHPExcel_RichText($pActiveSheet->getCellByColumnAndRow($i+1, $pRow));
            $tmp = $objRichText->createTextRun("{$pColumns [$i]}");
            $tmp->getFont ()->setBold (true);
        }
    }
    
    function insert_data ($pActiveSheet, $pRow, $pColumn, $pData) {
        $count_rows = count($pData);
        $count_cols = count($pData [0]);
        $x = null;

        for ($i = $pRow; $i < $pRow + $count_rows; $i++)
            for ($j = $pColumn; $j < $pColumn + $count_cols; $j++) {
                //echo "$i <br>"; echo "$j<br>"; echo "{$pData [$i - $pRow][$j - $pColumn]}<br>";

                $pActiveSheet->getCellByColumnAndRow($j, $i)->setValue ($pData [$i - $pRow][$j - $pColumn]);
            }

        return $pRow + $count_rows;
    }
?>

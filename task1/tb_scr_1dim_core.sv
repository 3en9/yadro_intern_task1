// Топ-модуль верификационного окружения
// скреблера(шифратора на (linear feedback shift register, LFSR)).

//  ------------------ TODO -------------------
// | В данном задании все изменения необходимо |
// | вносить в этот файл                       |
//  ------------------ TODO -------------------

module tb_scr_1dim_core ();

    parameter DATA_WIDTH    = 1;
    parameter SCR_WIDTH     = 7;


    // Определение тактового сигнала и
    // сигнала сброса.
    logic clk;
    logic kill;

    // Определение проводов, которые будут
    // подключены к портам модуля.
             logic                          scr_en;
             logic  [DATA_WIDTH-1:0]        data_in;
             logic                          data_in_en;
             logic  [SCR_WIDTH-1:0]         init_val;
             logic                          init_val_en;
             logic  [DATA_WIDTH-1:0]        data_out;
             logic                          data_out_en;
             logic  [DATA_WIDTH-1:0]        scr_seq;
             logic  [SCR_WIDTH-1:0]        scr_reg;
    // Подключение тестируемого модуля.
    scr_1dim_core #(
        .DATA_WIDTH      (DATA_WIDTH ),
        .SCR_WIDTH     (SCR_WIDTH)
    ) DUT (
        .clk                ( clk        ),
        .kill               ( kill       ),
        .scr_en             ( scr_en     ),
        .data_in            ( data_in    ),
        .data_in_en         ( data_in_en ),
        .init_val_en        ( init_val_en),
        .init_val           ( init_val),
        .data_out           ( data_out   ),
        .data_out_en        ( data_out_en )
    );

    initial begin
        // Настройка waveform
        // Необходимо для создание временных диаграмм 
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_scr_1dim_core); 
    end

    // Генерация тактового сигнала.
    initial begin
        clk <= 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    // Генерация сигнала сброса.
    initial begin
        kill <= 1'b1;
        @(posedge clk);
        kill = 1'b0;
    end

    initial begin
        $display("1");
        init_val_en = 0;
        init_val = 7'h00;
        scr_en = 0;
        data_in_en = 0;
        data_in = 0;
        #25;
        init_val_en = 1;
        init_val = 7'h10;
        #10;
        init_val_en = 0;
        #10;
        scr_en = 1;
        data_in_en = 1;
        #10;
        data_in = 1;
        #10;
        data_in = 0;
        #10;
        data_in = 1;
        #10;
        data_in = 0;
        #10;
        data_in = 1;
        #10;
        data_in = 0;
        data_in_en = 0;
        scr_en = 0;
                //  ------------------ TODO ---------------------
        // | Тестовое воздействие необходимо писать здесь|
        //  ------------------ TODO ---------------------

        // Завершение.
        #30;
        $finish();
    end
    initial begin
        $monitor("time=%3d, clk=%b, kill=%b, init_val_en=%b, init_val=%h, scr_en=%b, data_in_en=%b, data_in=%b||data_out=%b, data_out_en=%b", $time, clk,kill,init_val_en, init_val, scr_en, data_in_en, data_in, data_out, data_out_en);
    end

endmodule
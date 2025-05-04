// Топ-модуль верификационного окружения

//  ------------------ TODO -------------------
// | В данном задании все изменения необходимо |
// | вносить в этот файл                       |
//  ------------------ TODO -------------------

module tb_fulladder;

    // Определение тактового сигнала и
    // сигнала сброса.
    logic clk_i;
    logic areset_i;

    // Определение проводов, которые будут
    // подключены к портам блока.
    logic A_i;
    logic B_i;
    logic Cin_i;
    logic Cout_o;
    logic S_o;
    
    // Подключение тестируемого модуля.
    fulladder_sync DUT (
        .clk_i    ( clk_i    ),
        .areset_i ( areset_i ),
        .A_i      ( A_i      ),
        .B_i      ( B_i      ),
        .Cin_i    ( Cin_i    ),
        .Cout_o   ( Cout_o   ),
        .S_o      ( S_o      )
    );

    initial begin
        // Настройка waveform
        // Необходимо для создание временных диаграмм 
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_fulladder); 
    end
    initial begin
        clk_i <= 1'b0;
        forever begin
            #5 clk_i = ~clk_i;
        end
    end
    initial begin

        //  ------------------ TODO ---------------------
        // | Тестовое воздействие необходимо писать здесь|
        //  ------------------ TODO ---------------------

        // Завершение.
        A_i = 0;
        B_i = 0;
        Cin_i = 0;
        areset_i = 1;
        #10;
        areset_i = 0;
        #5;
        A_i = 1;
        #10;
        A_i = 0;
        B_i = 1;
        #10;
        A_i = 1;
        #10;
        A_i = 0;
        B_i = 0;
        Cin_i = 1;
        #10;
        A_i = 1;
        #10;
        A_i = 0;
        B_i = 1;
        #10;
        A_i = 1;
        #15;
        $finish();
    end

endmodule

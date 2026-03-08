module traffic_light_controller (
    input clk, rst,
    output reg [1:0] NS, EW
);
    reg [2:0] state;
    reg [31:0] count;
// regs: state, count
    parameter CLK_FREQ = 50;
    parameter GREEN_COUNT = 45 * CLK_FREQ;
    parameter YELLOW_COUNT = 5 * CLK_FREQ;
    parameter RED_COUNT = 10 * CLK_FREQ;
// parameters: CLK_FREQ, GREEN_COUNT, YELLOW_COUNT, ALLRED_COUNT
    parameter RED = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN = 2'b10;
// parameters: RED, YELLOW, GREEN encoding
    parameter NS_GREEN = 3'b000;
    parameter NS_YELLOW = 3'b001;
    parameter NS_RED = 3'b010;
    parameter EW_GREEN = 3'b011;
    parameter EW_YELLOW = 3'b100;
    parameter EW_RED = 3'b101;
// parameters: state names (optional but recommended)
    
// Block 1 — counter
    always @(posedge clk) begin
        if(rst) begin
            count <=0;
        end
        else if ((count == GREEN_COUNT) & ((state ==3'b000)|(state == 3'b011))) begin
            count <= 0;
        end
        else if ((count == YELLOW_COUNT) & ((state ==3'b001)|(state == 3'b100)))begin
            count <= 0;
        end
        else if ((count == RED_COUNT) & ((state ==3'b010)|(state == 3'b101))) begin
            count <= 0;
        end
        else 
            count <= count + 1;
    end

// Block 2 — state register  
    always @(posedge clk) begin
        if ((rst) || ((count == RED_COUNT) && (state == 3'b101))) 
            state <= 3'b000;
        else if ((count == GREEN_COUNT) && ((state == 3'b000)||(state == 3'b011)))
            state <= state + 1;
        else if ((count == YELLOW_COUNT) && ((state == 3'b001)||(state == 3'b100)))
            state <= state + 1;
        else if ((count == RED_COUNT) && (state == 3'b010))
            state <= state + 1;
    end

// Block 3 — output logic
    always @(*) begin
        case(state)
            3'b000: begin 
                NS=GREEN; 
                EW=RED; 
            end
            3'b001: begin 
                NS=YELLOW; 
                EW=RED; 
            end
            3'b010: begin 
                NS=RED; 
                EW=RED; 
            end
            3'b011: begin 
                NS=RED; 
                EW=GREEN; 
            end
            3'b100: begin 
                NS=RED; 
                EW=YELLOW; 
            end
            3'b101: begin 
                NS=RED; 
                EW=RED; 
            end
            default:begin
                NS=RED;
                EW=RED;
            end
        endcase
    end
endmodule


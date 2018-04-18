
`timescale 1ns / 1ps

module ee354_spinvaders_sm(Clk, reset, L, R, shoot, topY, midY, botY, 
	alien1X, alien2X,alien3X,alien4X,alien5X,alien6X,alien7X,alien8X,alien9X,alien10X,alien11X,alien12X,alien13X,alien14X,alien15X);
    input Clk, reset;
	 input L, R;
	 input shoot;
	 output[9:0] topY, midY, botY;
	 output reg[9:0] alien1X, alien2X,alien3X,alien4X,alien5X;
	 output reg[9:0] alien6X, alien7X,alien8X,alien9X,alien10X;
	 output reg[9:0] alien11X, alien12X,alien13X,alien14X,alien15X;
	 reg[9:0] topY, midY, botY;
	 reg[5:0] score;
	 
	 reg[9:0] projectileX, projectileY;
    initial
	 begin
		
	end
	 always @(posedge Clk)
	 begin
		if(reset)
		begin
			alien1X = 10'd30; 		
			alien2X = 10'd130;
			alien3X = 10'd230;
			alien4X = 10'd330;
			alien5X = 10'd430;
		
			alien6X = 10'd130;
			alien7X = 10'd230;
			alien8X = 10'd330;
			alien9X = 10'd430;
			alien10X = 10'd530;
		
			alien11X = 10'd30;
			alien12X = 10'd130;
			alien13X = 10'd230;
			alien14X = 10'd330;
			alien15X = 10'd430;

			topY <= 10'd30;
			midY <= 10'd90;
			botY <= 10'd150;
		end
	 end
    always @(posedge Clk) //Movement of the ship
		begin
			if(reset)
				position<= 400;
			else if(L && ~R)
				position<=position-5;
			else if(R && ~L)
				position<=position+5;	
		end
		
	 always @ (posedge clk) //Projectile tracking
	 begin
		 if(projectileX == 10'd900 ) //No projectile 
		 begin
			if(shoot) //If shoot command is active. create the new projetile 
			begin
				projectileX <= position;
				projectileY <= 400;
			end
		 end
		 else if(projectileY == 0) //If projectile hits top of screen, delete the projectile
		 begin
			projectileX <= 10'd900; 
			projectileY <=0;
		 end
		 else if( projectileY <= topY +20 && projectileY >= topY-20) //Y range of top row
		 begin
			if(projectileX <= alien1X+10 && projectileX >=alien1X-10)
			begin
				projectileX <= 10'd900;
				alien1X <=
				score <= score + 10;
			end
			else if(projectileX <= alien2X+10 && projectileX >=Alien2X-10)
			begin
				projectileX <= 10'd900;
				
			end
		 end
		 else //move projectile up the screen if projectile hasn't hit any aliens or top of screen.
		 begin
			projectileY <= projectileY - 10; 
		 end
	 end
	 
    always @ (posedge Clk, posedge reset)
		begin
			if(reset)
				state <= QI;
			else 
			begin
				
		end
	end
endmodule 
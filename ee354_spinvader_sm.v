
`timescale 1ns / 1ps

module ee354_spinvaders_sm(Clk, reset, L, R, shoot, topY, midY, botY, position, projectileX, projectileY,
	alien1X, alien2X,alien3X,alien4X,alien5X,alien6X,alien7X,alien8X,alien9X,alien10X,alien11X,alien12X,alien13X,alien14X,alien15X);
    input Clk, reset;
	 input L, R;
	 input shoot;
	 output[9:0] topY, midY, botY;
	 output reg[9:0] alien1X, alien2X,alien3X,alien4X,alien5X;
	 output reg[9:0] alien6X, alien7X,alien8X,alien9X,alien10X;
	 output reg[9:0] alien11X, alien12X,alien13X,alien14X,alien15X;
	 output reg[9:0] position, projectileX, projectileY;
	 reg[9:0] topY, midY, botY;
	 reg[5:0] score;

	 always @(posedge Clk)
	 begin
		if(reset)
		begin
			alien1X <= 10'd30; 		
			alien2X <= 10'd130;
			alien3X <= 10'd230;
			alien4X <= 10'd330;
			alien5X <= 10'd430;
		
			alien6X <= 10'd130;
			alien7X <= 10'd230;
			alien8X <= 10'd330;
			alien9X <= 10'd430;
			alien10X <= 10'd530;
		
			alien11X <= 10'd30;
			alien12X <= 10'd130;
			alien13X <= 10'd230;
			alien14X <= 10'd330;
			alien15X <= 10'd430;

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
		
	 always @ (posedge Clk) //Projectile tracking
	 begin
		if(reset)
		begin
			projectileX <= 10'd900;
			projectileY <= 0;
		end
		
		 else if(projectileX == 10'd900 ) //No projectile 
		 begin
			if(shoot) //If shoot command is active. create the new projectile 
			begin
				projectileX = position;
				projectileY = 400;
			end
		 end
		 else if(projectileY == 0) //If projectile hits top of screen, delete the projectile
		 begin
			projectileX <= 10'd900;  
			projectileY <= 10;
		 end
		 else if( projectileY <= topY +20 && projectileY >= topY-20) //Y range of top row
		 begin 
			if(projectileX <= alien1X+10 && projectileX >=alien1X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=10;
				alien1X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien2X+10 && projectileX >=alien2X-10)
			begin
				projectileX <= 10'd900;
				projectileY <= 10;
				alien2X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien3X+10 && projectileX >=alien3X-10)
			begin
				projectileX <= 10'd900;
				projectileY <= 10;
				alien3X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien4X+10 && projectileX >=alien4X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien4X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien5X+10 && projectileX >=alien5X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien5X <= 10'd950;
				score <= score + 10;
			end
			else
				projectileY <= projectileY - 10;
		 end
		 else if( projectileY <= midY +20 && projectileY >= midY-20) //Middle row
		 begin
			if(projectileX <= alien6X+10 && projectileX >=alien6X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien6X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien7X+10 && projectileX >=alien7X-10) 
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien7X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien8X+10 && projectileX >=alien8X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien8X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien9X+10 && projectileX >=alien9X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien9X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien10X+10 && projectileX >=alien10X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien10X <= 10'd950;
				score <= score + 10;
			end
			else
				projectileY <= projectileY - 10;
		 end
		 else if( projectileY <= botY +20 && projectileY >= botY-20) //Bottom Row
		 begin
			if(projectileX <= alien11X+10 && projectileX >=alien11X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien11X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien12X+10 && projectileX >=alien12X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien12X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien13X+10 && projectileX >=alien13X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien13X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien14X+10 && projectileX >=alien14X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien14X <= 10'd950;
				score <= score + 10;
			end
			else if(projectileX <= alien15X+10 && projectileX >=alien15X-10)
			begin
				projectileX <= 10'd900;
				projectileY <=0;
				alien15X <= 10'd950;
				score <= score + 10;
			end
			else
				projectileY <= projectileY - 10;
		 end
		 else //move projectile up the screen if projectile hasn't hit any aliens or top of screen.
		 begin
			projectileY <= projectileY - 10; 
		 end
	 end
endmodule 
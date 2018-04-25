
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
	 output reg[9:0] returnX, returnY;
	 reg[9:0] topY, midY, botY, base;
	 reg[5:0] score;
	 reg[3:0] alienSel;
	 reg direction;
    always @(posedge Clk) //Movement of the ship
		begin
			if(reset)
				position<= 400;
			else if(L && ~R)
				position<=position-5;
			else if(R && ~L)
				position<=position+5;	
		end
	always @(posedge Clk) //return fire tracking
	begin
		if(reset)
		begin
			alienSel <= 1;
			returnX <= 0;
			returnY <= 0;
		end
		else if( returnY >= 480 )
		begin
			case(alienSel)
			4'd0: alienSel <= alienSel + 6;
			4'd1: 
			if(alien1X == 950) alienSel <=alienSel + 6;
			else
			begin
				returnX <= alien1X;
				returnY <= topY;
			end
			4'd2: 
			if(alien2X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien2X;
				returnY <= topY;
			end
			4'd3: 
			if(alien3X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien3X;
				returnY <= topY;
			end
			4'd4: 
			if(alien4X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien4X;
				returnY <= topY;
			end
			4'd5: 
			if(alien5X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien5X;
				returnY <= topY;
			end
			4'd6: 
			if(alien6X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien6X;
				returnY <= midY;
			end
			4'd7: 
			if(alien7X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien7X;
				returnY <= midY;
			end
			4'd8: 
			if(alien8X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien8X;
				returnY <= midY;
			end
			4'd9: 
			if(alien9X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien9X;
				returnY <= midY;
			end
			4'd10: 
			if(alien10X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien10X;
				returnY <= midY;
			end
			4'd11: 
			if(alien11X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien11X;
				returnY <= botY;
			end
			4'd12: 
			if(alien12X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien12X;
				returnY <= botY;
			end
			4'd13: 
			if(alien13X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien13X;
				returnY <= botY;
			end
			4'd14: 
			if(alien14X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien14X;
				returnY <= botY;
			end
			4'd15: 
			if(alien15X == 950)alienSel <= alienSel + 6;
			else
			begin
				returnX <= alien15X;
				returnY <= botY;
			end
			endcase
		end
		else
		begin
			returnY <= returnY + 10;
		end
		if( returnY > 415 && returnY < 435 && returnX > position-10 && returnY < position+10)
		begin
			returnX <= 920;
			returnY <= 0;
			position <= 950;
		end
	end
	 always @ (posedge Clk) //Projectile tracking
	 begin
		if(direction)
		begin
			if(base > 10)
				direction <= 0;
			else
			begin
				alien1X <= alien1X + 10; 		
				alien2X <= alien2X + 10;
				alien3X <= alien3X + 10;
				alien4X <= alien4X + 10;
				alien5X <= alien5X + 10;
		
				alien6X <= alien6X + 10;
				alien7X <= alien7X + 10;
				alien8X <= alien8X + 10;
				alien9X <= alien9X + 10;
				alien10X <= alien10X + 10;
		
				alien11X <= alien11X + 10;
				alien12X <= alien12X + 10;
				alien13X <= alien13X + 10;
				alien14X <= alien14X + 10;
				alien15X <= alien15X + 10;
			end
		end
		else
		begin
			if(base == 0)
				direction <=1;
			else
			begin
				base <= base-1;
				alien1X <= alien1X - 10; 		
				alien2X <= alien2X - 10;
				alien3X <= alien3X - 10;
				alien4X <= alien4X - 10;
				alien5X <= alien5X - 10;
		
				alien6X <= alien6X - 10;
				alien7X <= alien7X - 10;
				alien8X <= alien8X - 10;
				alien9X <= alien9X - 10;
				alien10X <= alien10X - 10;
		
				alien11X <= alien11X - 10;
				alien12X <= alien12X - 10;
				alien13X <= alien13X - 10;
				alien14X <= alien14X - 10;
				alien15X <= alien15X - 10;
			end
		end
		if(reset)
		begin
			direction <=1;
			base <=0;
			projectileX <= 10'd900;
			projectileY <= 0;
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
		 else if(projectileX == 10'd900 ) //No projectile 
		 begin
			if(shoot) //If shoot command is active. create the new projectile 
			begin
				projectileX <= position;
				projectileY <= 400;
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
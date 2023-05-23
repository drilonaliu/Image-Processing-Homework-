## Copyright (C) 2023 drilo
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} Zhurma (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: drilo <drilo@DESKTOP-EK742QI>
## Created: 2023-05-22


function retval = Zhurma(shperndarja, x, y, z, k, s, a, b)
    % Generate noise based on the specified distribution
    noise = zeros(z-x+1, k-y+1);

    for i = x:z
        for j = y:k
            if strcmp(shperndarja, 'Rayleigh')
                noise(i-x+1, j-y+1) = raylrnd(a);
            elseif strcmp(shperndarja, 'Eksponenciale')
                noise(i-x+1, j-y+1) = exprnd(a);
            elseif strcmp(shperndarja, 'LogNormal')
                noise(i-x+1, j-y+1) = lognrnd(a, b);
            elseif strcmp(shperndarja, 'Salt&Pepper')
                noise(i-x+1, j-y+1) = imnoise(0, 'salt & pepper', a);
            elseif strcmp(shperndarja, 'Erlang')
                noise(i-x+1, j-y+1) = gamrnd(a, b);
            else
              error(['Shperndarja ' shperndarja ' e zgjedhur nuk eshte valide!']);

            end
        end
    end

    retval = noise;
endfunction

function result = DetyraGrupi5(img)
    % Merre gjatesin, gjeresin dhe kanalet e ngjyres se figures
    % Dhe ruaj ne variablat rows, cols dhe channels
    [rows, cols, channels] = size(img);

    % Kalkuloje nje te katerten te figures baze dhe ruaj ne variabla
    rows_divided = floor(rows / 4);
    cols_divided = floor(cols / 4);

    % Inicializo matricat ku vendosen rezultatet

    % matrica qe do te i mbaj te gjtha blloqet 4X4
    % variabla e pare dhe e dyte tregojne gjatesin dhe gjeresin,
    % variabla e trete tregon sa variabla duhet te ruhen
    % variabla e katert jane kanalet e ngjyres
    blocks = zeros(4, 4, rows_divided * cols_divided, channels);

    % matrica ku ruhet rezultati final
    result = zeros(rows_divided, cols_divided, channels);

    % indeksat per te levizur ne matricen blocks
    block_idx = 1;
    result_idx = 1;

    % ndarja e imazhit ne blloqe 4X4
    % for loops kalojne ne tere matricen
    for i = 1:rows_divided
        for j = 1:cols_divided
            % e merr pixelin ne top left te "seksionit"
            start_row = (i-1)*4 + 1;
            start_col = (j-1)*4 + 1;

            % prej pixellit top left i merr blloqet deri ne bottom right dhe i ruan
            block = img(start_row:start_row+3, start_col:start_col+3, :);

            % e vendos blloqin ne matricen kryesore ne indeksin e rradhes
            blocks(:, :, block_idx, :) = block;
            % rritet indeksi per 1 per heren tjeter
            block_idx = block_idx + 1;

        end
    end

    % for loops per rezultatin
     for i = 1:rows_divided
        for j = 1:cols_divided
          % nga matrica me blloqet 4X4 e merr pikselin ne poziten 2,2 dhe e vendos ne matricen finale
          result(i, j, :) = blocks(2, 2, result_idx, :);
          % rritet indeksi per 1 per heren tjeter
          result_idx = result_idx + 1;
        end
    end
    % e perkthen matricen ne uint8
    result = uint8(result);
    % e shfaq imazhin fillestar dhe te modifikuar
    imshow(img), figure, imshow(result);
end

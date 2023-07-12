clear; close all; clc;

P1_img = zeros(340,340,3,5);
P2_img = zeros(340,340,3,5);

%% ask Players for input
P1_choice = [];
while length(P1_choice) < 5
    message_to_player = 'Player 1, please enter 5 moves.';
    P1_choice = passcode('letter',message_to_player);
end

P2_choice = [];
while length(P2_choice) < 5
    message_to_player = 'Player 2, please enter 5 moves.';
    P2_choice = passcode('letter',message_to_player);
end

% initial tally of scores
P1_score = 0;
P2_score = 0;
for round_number = 1:5
    P1_current_move = upper(P1_choice(round_number));
    P2_current_move = upper(P2_choice(round_number));
    
    %% assign image corresponding to selected move
    if P1_current_move == 'R'
        P1_img(:,:,:,round_number) = imread('images/rock_p1.png');

    elseif P1_current_move == 'P'
        P1_img(:,:,:,round_number) = imread('images/paper_p1.png');

    elseif P1_current_move == 'S'
        P1_img(:,:,:,round_number) = imread('images/scissors_p1.png');
    end

    if P2_current_move == 'R'
        P2_img(:,:,:,round_number) = imread('images/rock_p2.png');
    elseif P2_current_move == 'P'
        P2_img(:,:,:,round_number) = imread('images/paper_p2.png');
    elseif P2_current_move == 'S'
        P2_img(:,:,:,round_number) = imread('images/scissors_p2.png');
    end

    %% make a decision: who won this round? who gets an additional point?
    if P1_current_move == 'R'
        if P2_current_move == 'P'
            P2_score = P2_score + 1;
        elseif P2_current_move == 'S'
            P1_score = P1_score + 1;
        end
    elseif P1_current_move == 'P'
        if P2_current_move == 'R'
            P1_score = P1_score + 1;
        elseif P2_current_move == 'S'
            P2_score = P2_score + 1;
        end
    elseif P1_current_move == 'S'
        if P2_current_move == 'R'
            P2_score = P2_score + 1;
        elseif P2_current_move == 'P'
            P1_score = P1_score + 1;
        end
    end
end

figure('Name','Results!')
%% display the moves per round!
for round_number = 1:5
    pause;
    subplot(5,2,2*(round_number-1)+1); 
    imshow(P1_img(:,:,:,round_number))
    title(strcat('Player1, round',num2str(round_number)));

    subplot(5,2,2*round_number); 
    imshow(P2_img(:,:,:,round_number))
    title(strcat('Player2, round',num2str(round_number)));
    pause;
end

if P1_score > P2_score
    disp('P1 WINS!');
elseif P1_score < P2_score
    disp('P2 WINS!');
elseif P1_score == P2_score
    disp('WE HAVE A TIE!');
end

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

P1_prime = imread('images/rock_p1.png');
P2_prime = imread('images/rock_p2.png');
prime_pause = imread('images/prime.png') ;

figure('Name','Results!')
%% display the moves per round!
for round_number = 1:5
    for prime_gesture = 1:2
        pause;
        subplot(5,2,2*(round_number-1)+1); 
        imshow(P1_prime)
        title(strcat('Player1, round',num2str(round_number)));
        
        subplot(5,2,2*round_number); 
        imshow(P2_prime)
        title(strcat('Player2, round',num2str(round_number)));

        pause;
        subplot(5,2,2*(round_number-1)+1); 
        imshow(prime_pause)
        title(strcat('Player1, round',num2str(round_number)));
        
        subplot(5,2,2*round_number); 
        imshow(prime_pause)
        title(strcat('Player2, round',num2str(round_number)));
        
    end
    pause;
    P1_throw = P1_img(:,:,:,round_number);
    subplot(5,2,2*(round_number-1)+1); 
    imshow(P1_throw);
    title(strcat('Player1, round',num2str(round_number)));
    
    P2_throw = P2_img(:,:,:,round_number);
    subplot(5,2,2*round_number); 
    imshow(P2_throw)
    title(strcat('Player2, round',num2str(round_number)));
end

winner_img = ones(340,340);
if P1_score > P2_score
    disp('Player 1 WINS');
elseif P1_score < P2_score
    disp('Player 2 WINS');
elseif P1_score == P2_score
    disp('WE HAVE A TIE')
end
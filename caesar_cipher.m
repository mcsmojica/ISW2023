clear; clc; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% enter your encrypted message and shift value
shift_val = 1;
recipient = 'B';
message_body = 'UIBOLT GPS MJTUFOJOH';
sender = 'A';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% decode the components of the encrypted message
recipient = caesar(recipient, shift_val);
message_body = caesar(message_body, shift_val);
sender = caesar(sender, shift_val);


% display the message in a separate window
figure('Name','Thank you note');
imshow(imread('images/heart_pixelated.png'),[]);
title([recipient ', ' message_body '. ' sender])

function decoded = caesar(phrase, shift_val)
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    num_letters = length(phrase);
    
    decoded = '';

    % reveal encrypted message by shifting the alphabet up by a specified
    % number of positions
    for i = 1:num_letters
        % determine current character
        curr_char = upper(phrase(i));
        if curr_char == ' '
            decoded = [decoded ' '];
        else
            % find the numerical order of the encrypted letter
            curr_char_val = find(alphabet==curr_char);
            % shift it back by shift_val positions
            shifted_char_val = mod(curr_char_val-shift_val,26);
            if shifted_char_val==0
                shifted_char_val = 26;
            end
            % update the decoded string
            decoded = [decoded alphabet(shifted_char_val)];
        end
    end
end
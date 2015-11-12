format compact
clear all
clc

userin = input('Enter text for encryption: ','s');
invec = double(userin);
inlength = length(invec);

for i = 1:inlength
    if mod(i,2) == 0 && mod(invec(i),2) == 0
        invec(i) = invec(i) + 2;
    elseif mod(i,2) == 0 && mod(invec(i),2) == 1
        invec(i) = invec(i) + 4;
    elseif mod(i,2) == 1 && mod(invec(i),2) == 0
        invec(i) = invec(i) + 6;
    else
        invec(i) = invec(i) + 8;
    end
end

encryptedtext = char(invec)
outvec = double(encryptedtext);

for i = 1:inlength
    if mod(i,2) == 0 && mod(outvec(i),2) == 0
        outvec(i) = outvec(i) - 2;
    elseif mod(i,2) == 0 && mod(outvec(i),2) == 1
        outvec(i) = outvec(i) - 4;
    elseif mod(i,2) == 1 && mod(outvec(i),2) == 0
        outvec(i) = outvec(i) - 6;
    else
        outvec(i) = outvec(i) - 8;
    end
end

originaltext = char(outvec)
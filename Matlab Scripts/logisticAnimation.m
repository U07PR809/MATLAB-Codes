% implements the logistic equation
% x(n + 1) = r x(n) (1 - x(n))

% prompts for initial condition
x0 = input('Please enter the initial condition x(0): ');

% checks initial condition 0 < x0 < 1
if x0 <= 0 || x0 >= 1
    error('Initial condition should be between 0 and 1, both exclusive')
end

% creates row vector of parameter, r 
r = linspace(0, 4, 100);

% creates row vector of variable, x
x = x0*ones(1, 100);

% iterates over parameter, r
for iterR = 1: length(r) 
    % iterates over variable, x
    for iterX = 1: length(x)-1
        x(iterX + 1) = r(iterR) * x(iterX) * (1 - x(iterX));
    end
    
    % plots x(n) vs n
    graph = plot(1: 100, x, 'LineWidth', 1.2);
    xlim([1, 100])
    xlabel('n')
    ylabel('x(n)')
    str = sprintf('r = %0.2f', r(iterR));
    title(str)
    
    grid on
    grid minor
    
    drawnow
    frame(iterR) = getframe(gcf);
    
    % pauses execution for 0.3 s
    pause(0.3);
    delete(graph)
end

video = VideoWriter('movie.avi', 'Uncompressed AVI' );
open(video)
writeVideo(video, frame)
close(video)
close all


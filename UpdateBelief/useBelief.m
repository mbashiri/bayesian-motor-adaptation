function [ Fx_adapt, Fy_adapt ] = useBelief( currentVx, currentVy, Vx, Vy, sspace )
% USEBELIEF returns the adaptation force (the force applied by the subject)
%
% INPUTS: 
%   - Current state (current Vx, current Vy)
%   - Range of states (Vx, Vy), State space
%   - State space (sspace)

% OUTPUT: 
%   - Adaptation Force

% steps:
%
% 1) Find the force distribution for the given state (Vx, Vy)
% 2) Sample from this distribution to find Fx and Fy
% 3) 

[indVx, indVy] = findStateInd(currentVx, currentVy, Vx, Vy);

% The mu and sigma for the force distribution of current state
mu    = [sspace(1,1,indVx, indVy) sspace(2,1,indVx, indVy)];
sigma = [sspace(1,2,indVx, indVy) 0;0 sspace(2,2,indVx, indVy)];

[ Fx_adapt, Fy_adapt ] = mvnrnd(mu,sigma);

end

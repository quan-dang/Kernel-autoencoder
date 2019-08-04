function K = constructKernel(fea_a,fea_b,options)
% function K = constructKernel(fea_a,fea_b,options)
%	Usage:
%	K = constructKernel(fea_a,[],options)
%
%   K = constructKernel(fea_a,fea_b,options)
%
%	fea_a, fea_b  : Rows of vectors of data points. 
%
%   options       : Struct value in Matlab. The fields in options that can
%                   be set: 
%           KernelType  -  Choices are:
%               'Gaussian'      - e^{-(|x-y|^2)/2t^2}
%               'Laplace'       - e^{-(|x-y|)/t} <=> e^{-(|x-y|)*tt}
%                                 For computing effectively, here we use
%                                 the second one with the parameter tt 
%                                 (tt = 1/t).
%               'Polynomial'    - (x'*y)^d
%               'PolyPlus'      - (x'*y+1)^d
%               'Linear'        -  x'*y
%
%               t       -  parameter for Gaussian, t>0
%               tt      -  parameter for Laplace, for computing
%                          effectively, here we use tt instead of 1/t, tt>0
%               d       -  parameter for Poly, d>1, when d=1, it's just
%                          the "Linear" kernel.
%
%   version 1.0 --Sep/2006 
%

%

if (~exist('options','var'))
   options = [];
else
   if ~isstruct(options) 
       error('parameter error!');
   end
end



%=================================================
if ~isfield(options,'KernelType')
    options.KernelType = 'Gaussian';
end

switch lower(options.KernelType)
    case {lower('Gaussian')}        %  e^{-(|x-y|^2)/2t^2}
        if ~isfield(options,'t')
            options.t = 1;
        end
    case {lower('Laplace')}        %  e^{-(|x-y|)/t} <=> e^{-(|x-y|)*tt}
        if ~isfield(options,'tt')
            options.tt = 1;
        end
    case {lower('Polynomial')}      % (x'*y)^d
        if ~isfield(options,'d')
            options.d = 2;
        end
    case {lower('PolyPlus')}      % (x'*y+r)^d
        if ~isfield(options,'d')
            options.d = 2;
        end
        if ~isfield(options,'r')
            options.r = 1;
        end        
    case {lower('Linear')}      % x'*y
    otherwise
        error('KernelType does not exist!');
end


%=================================================

switch lower(options.KernelType)
    case {lower('Gaussian')}       
        if isempty(fea_b)
            D = EuDist2(fea_a,[],0);
        else
            D = EuDist2(fea_a,fea_b,0);
        end
        K = exp(-D/(2*options.t^2));
        % K = exp(-D*options.t);
    case {lower('Laplace')}
        if isempty(fea_b)
            D = EuDist2(fea_a);
        else
            D = EuDist2(fea_a,fea_b);
        end
        % We use tt instead of t, (tt=1/t).
        K = exp(-D*options.tt); 
    case {lower('Polynomial')}     
        if isempty(fea_b)
            D = full(fea_a * fea_a');
        else
            D = full(fea_a * fea_b');
        end
        K = D.^options.d;
    case {lower('PolyPlus')}     
        if isempty(fea_b)
            D = full(fea_a * fea_a');
        else
            D = full(fea_a * fea_b');
        end
        K = (D+options.r).^options.d;
    case {lower('Linear')}     
        if isempty(fea_b)
            K = full(fea_a * fea_a');
        else
            K = full(fea_a * fea_b');
        end
    otherwise
        error('KernelType does not exist!');
end

if isempty(fea_b)
    K = max(K,K');
end

    

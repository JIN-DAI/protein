function y = testall( func, x )
y = do_test( func, x.value_ );

function y = do_test( func, x )
switch class( x ),
    case 'struct',
        y = do_test( func, struct2cell( x ) );
    case 'cell',
        global cvx___
        if cvx___.mversion < 7.1,
            y = true;
            for k = 1 : numel( x ),
                if ~feval( func, x{k} ), y = false; break; end
            end
        else
            y = all( cellfun( func, x ) );
        end
    otherwise,
        y = feval( func, x );
end

% Copyright 2008 Michael C. Grant and Stephen P. Boyd. 
% See the file COPYING.txt for full copyright information.
% The command 'cvx_where' will show where this file is located.

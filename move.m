function [V,score]=move(V,a,score)
    if a==30
    %up
        for j=1:4
            for i=1:3
                if max(V(i:end,j))==0
                    break
                end
                while V(i,j)==0
                    V(i:end-1,j)=V(i+1:end,j);
                    V(end,j)=0;
                end
            end
        end
        for j=1:4
            for i=1:3 
                if V(i,j)==V(i+1,j)
                    V(i,j)=2*V(i+1,j);
                    V(i+1,j)=0;
                    score=score+V(i,j);
                end
            end
        end
        for j=1:4
            for i=1:3
                if max(V(i:end,j))==0
                    break
                end
                while V(i,j)==0
                    V(i:end-1,j)=V(i+1:end,j);
                    V(end,j)=0;
                end
            end
        end
        
    elseif a==31
    %down
        for j=1:4
            for i=4:-1:2
                if max(V(1:i,j))==0
                    break
                end
                while V(i,j)==0
                    V(2:i,j)=V(1:i-1,j);
                    V(1,j)=0;
                end
            end
        end
        for j=1:4
            for i=4:-1:2 
                if V(i,j)==V(i-1,j)
                    V(i,j)=2*V(i-1,j);
                    V(i-1,j)=0;
                    score=score+V(i,j);
                end
            end
        end
        for j=1:4
            for i=4:-1:2
                if max(V(1:i,j))==0
                    break
                end
                while V(i,j)==0
                    V(2:i,j)=V(1:i-1,j);
                    V(1,j)=0;
                end
            end
        end
    elseif a==28
    %left
        for i=1:4
            for j=1:3
                if max(V(i,j:end))==0
                    break
                end
                while V(i,j)==0
                    V(i,j:end-1)=V(i,j+1:end);
                    V(i,end)=0;
                end
            end
        end
   
        for i=1:4 
            for j=1:3
                if V(i,j)==V(i,j+1)
                    V(i,j)=2*V(i,j+1);
                    V(i,j+1)=0;
                    score=score+V(i,j);
                end
            end
        end
        for i=1:4
            for j=1:3
                if max(V(i,j:end))==0
                    break
                end
                while V(i,j)==0
                    V(i,j:end-1)=V(i,j+1:end);
                    V(i,end)=0;
                end
            end
        end
    elseif a==29
    %prawo
        for i=1:4
            for j=4:-1:2
                if max(V(i,1:j))==0
                    break
                end
                while V(i,j)==0
                    V(i,2:j)=V(i,1:j-1);
                    V(i,1)=0;
                end
            end
        end
        for i=1:4
            for j=4:-1:2 
                if V(i,j)==V(i,j-1)
                    V(i,j)=2*V(i,j-1);
                    V(i,j-1)=0;
                    score=score+V(i,j);
                end
            end
        end
        for i=1:4
            for j=4:-1:2
                if max(V(i,1:j))==0
                    break
                end
                while V(i,j)==0
                    V(i,2:j)=V(i,1:j-1);
                    V(i,1)=0;
                end
            end
        end
    end
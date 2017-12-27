
function BB=Joincp(flag)
         
    
     if flag==0 %joining change points along two different dimensions
        
      
       %% load input parameters for 2D trajectories
        
        %load a matrix with columns:t,x,y
        [Filename,Path]=uigetfile({'.txt'},'Load a matrix with columns:t,x,y');

        if isequal(Filename,0)
             return
        else
             TT=importdata([Path Filename]);
        end
        
        if length(TT(1,:))~=3
          warndlg('The matrix must have three columns!')
          return
        end
        
        
        %load cp along x direction
        clear Filename Path
        [Filename,Path]=uigetfile({'.txt'},'Load the change points along the X direction');

        if isequal(Filename,0)
             return
        else
             a=importdata([Path Filename]);
        end
     
        %load cp along y direction 
        clear Filename Path
        [Filename,Path]=uigetfile({'.txt'},'Load the change points along the Y direction');

        if isequal(Filename,0)
             return
        else
             b=importdata([Path Filename]);
        end
         
        %% Joining cp for 2D trajectories
         
       BB=[];
       joinedcp=unique(sort([a(:,1);b(:,1)]));

       for i=1:length(joinedcp)
           ind=find(joinedcp(i)==TT(:,1));
           BB(i,1)=TT(ind,1);
           BB(i,2)=TT(ind,2);
           BB(i,3)=TT(ind,3);
       end
     figure
     plot(TT(:,2),TT(:,3),'-b',BB(:,2),BB(:,3),'or')
     xlabel('X')
     ylabel('Y')

     elseif flag==1 %joining change points along three different dimensions
         
          %% load input parameters for 3D trajectories
        
        %load a matrix with columns:t,x,y,z
        [Filename,Path]=uigetfile({'.txt'},'Load a matrix with columns:t,x,y,z');

        if isequal(Filename,0)
             return
        else
             TT=importdata([Path Filename]);
        end
        
        if length(TT(1,:))~=4
            warndlg('The matrix must have four columns!')
            return
        end
        %load cp along x direction
        clear Filename Path
        [Filename,Path]=uigetfile({'.txt'},'Load the change points along the X direction');

        if isequal(Filename,0)
             return
        else
             a=importdata([Path Filename]);
        end
     
        %load cp along y direction 
        clear Filename Path
        [Filename,Path]=uigetfile({'.txt'},'Load the change points along the Y direction');

        if isequal(Filename,0)
             return
        else
             b=importdata([Path Filename]);
        end
         
         %load cp along z direction 
        clear Filename Path
        [Filename,Path]=uigetfile({'.txt'},'Load the change points along the Z direction');

        if isequal(Filename,0)
             return
        else
             c=importdata([Path Filename]);
        end 
            
         %% Joining cp for 2D trajectories
             BB=[];
             joinedcp=unique(sort([a(:,1);b(:,1);c(:,1)]));

             for i=1:length(joinedcp)
                 ind=find(joinedcp(i)==TT(:,1));
                 BB(i,1)=TT(ind,1);
                 BB(i,2)=TT(ind,2);
                 BB(i,3)=TT(ind,3);
                 BB(i,4)=TT(ind,4);
             end
      figure
      plot3(TT(:,2),TT(:,3),TT(:,4),'-b',BB(:,2),BB(:,3),BB(:,4),'or')
      xlabel('X')
      ylabel('Y') 
      zlabel('Z')
      grid on
      axes square
         
         
      end
alldata = datcomimport('test.out', false, 0);
statdyn = datcomimport('test.out', false, 0);

data = statdyn{1};

fields = fieldnames(statdyn{1});


for i = 1:numel(fields)
    value = data.(fields{i});

    if isnumeric(value)
        value(isnan(value)) = 0;
        data.(fields{i}) = value;
    end
end
statdyn{1} = data;
low = 0.00001;

h1 = figure;
plot(alldata{1}.alpha,alldata{1}.cm(:,1));
axis([-4 8 -0.3 0.1]);
legend('Configuration 1');
xlabel('Angle of Attack');
ylabel('Pitching Moment Coefficient, C_m');
grid;

%%
aerotab = {'cyb' 'cnb' 'clq' 'cmq'};
for k = 1:length(aerotab)
    for m = 1:statdyn{1}.nmach
        for h = 1:statdyn{1}.nalt
            for t=1:statdyn{1}.nalpha
                statdyn{1}.(aerotab{k})(t,m,h,:) = statdyn{1}.(aerotab{k})(t,m,h,:);
            end
        end
    end
end

%% 

data.cm

h1 = figure;
plot(alldata{1}.alpha,alldata{1}.cm(:,1));

axis([-4 8 -0.3 0.1]);
legend('Configuration 1','Configuration 2');
xlabel('Angle of Attack, \alpha (degrees)');
ylabel('Pitching Moment Coefficient, C_m');
grid;

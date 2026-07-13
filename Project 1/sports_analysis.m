close all;
clc;
clear;

% Each row is an athlete, each column a skill: Speed(km/h), Endurance(min), Strength(kg), Agility(score)
athletes_data = [
    28, 45, 120, 8;
    32, 40, 135, 9;
    25, 55, 110, 7;
    35, 38, 140, 9;
    22, 50, 105, 6;
    30, 42, 128, 8;
    27, 48, 115, 7;
    33, 35, 145, 10
];
athletes_names = {'Ali', 'Reza', 'Sara', 'Maryam', 'Hassan', 'Zahra', 'Amir', 'Neda'}';

athletes_data_mean = mean(athletes_data);
athletes_data_median = median(athletes_data);
athletes_data_std = std(athletes_data);

fprintf("%-10s| %-12s| %-15s| %-13s| %-14s\n", "Parameter", "Speed(km/h)", "Endurance(min)", "Strength(kg)", "Agility(score)");
fprintf("%-10s| %-12f| %-15f| %-13f| %-14f\n", "Mean", athletes_data_mean(1), athletes_data_mean(2), athletes_data_mean(3), athletes_data_mean(4))
fprintf("%-10s| %-12f| %-15f| %-13f| %-14f\n", "Median", athletes_data_median(1), athletes_data_median(2), athletes_data_median(3), athletes_data_median(4))
fprintf("%-10s| %-12f| %-15f| %-13f| %-14f\n", "Std Dev", athletes_data_std(1), athletes_data_std(2), athletes_data_std(3), athletes_data_std(4))

is_above_mean = athletes_data > athletes_data_mean;
% No athlete is above mean in all skills.
% Let's find athletes above mean in 3 skills.
is_above_in_3_skills = sum(is_above_mean')' >= 3;
elite_athletes = athletes_names(is_above_in_3_skills);
disp(["Elite athletes are: ", elite_athletes{1}, ", ", elite_athletes{2}, ", and ", elite_athletes{3}])

skills = ["Speed(km/h)"; "Endurance(min)"; "Strength(kg)"; "Agility(score)"];
bar([1, 2, 3, 4], athletes_data_mean)
set(gca, 'XTickLabel', skills);
xlabel("Skills")
title("Bar Graph of each Skill")

figure
subplot(2, 1, 1)
scatter(athletes_data(:, 1), athletes_data(:, 3), "r")
title("Strength vs. Speed Diagram")
xlabel("Speed(km/h)")
ylabel("Strength(kg)")
subplot(2, 1, 2)
bar(athletes_data(:, 2))
set(gca, 'XTickLabel', athletes_names);
xlabel("Athletes' Names")
ylabel("Endurance(min)")
title("Endurance Bar of the Athletes")

save 'report.txt' athletes_data_mean -ascii

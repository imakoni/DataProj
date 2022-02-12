-- Kickstarter Projects Data Analysis


--To display the data being used

Select *
From DataProj.dbo.kickstarter_project
order by Category


--Determine the category with the highest success percentage

Select Category, Max(Goal) as Goal
From DataProj.dbo.kickstarter_project
group by Category
order by Goal desc


--Shows the highest amount pledged 

Select Country, category, Max(Pledged) as HighestPledged 
From DataProj.dbo.kickstarter_project
group by Country,Category
order by HighestPledged desc


--To find project with highest goal completion percentage
-- Also to find the amount pledged greater than a thousand dollars

Select Name, Goal, Pledged, Max((Pledged/Goal))*100 as CompletionPercentage 
From DataProj.dbo.kickstarter_project
where Pledged >'1000'
Group by Name, Goal, Pledged
order by CompletionPercentage desc


--Shows the category with the highest success rate

Select Category, count(state) as LevelofSuccess 
From DataProj.dbo.kickstarter_project
where state = 'successful'
group by Category 
order by LevelofSuccess desc


--Displays the category of projects with the highest rate of failure

 Select Category, count(state) as Failedstate
From DataProj.dbo.kickstarter_project
where state = 'failed'
group by Category
order by Failedstate desc

